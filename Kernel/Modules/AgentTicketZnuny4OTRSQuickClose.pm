# --
# Copyright (C) 2012-2022 Znuny GmbH, http://znuny.com/
# Copyright (C) (2014) (Denny Korsukéwitz) (dennykorsukewitz@gmail.com) (https://github.com/dennykorsukewitz)
# Copyright (C) (2020) (rsnakin) (https://github.com/rsnakin)

# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentTicketZnuny4OTRSQuickClose;

use Kernel::System::VariableCheck qw(:all);

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject              = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TicketObject              = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ArticleObject             = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $ConfigObject              = $Kernel::OM->Get('Kernel::Config');
    my $ParamObject               = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    my @ParamNames = $ParamObject->GetParamNames();

    my %GetParam;
    for my $Param (@ParamNames) {
        $GetParam{$Param} = $ParamObject->GetParam( Param => $Param ) || '';
    }

    if ( !$Self->{TicketID} ) {
        return $LayoutObject->ErrorScreen(
            Message => 'No TicketID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    my $Access = $TicketObject->TicketPermission(
        Type     => 'close',
        TicketID => $Self->{TicketID},
        UserID   => $Self->{UserID}
    );

    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    my $Config = $ConfigObject->Get('Znuny4OTRSQuickClose');

    my $DynamicField = $DynamicFieldObject->DynamicFieldListGet(
        Valid      => 1,
        ObjectType => 'Ticket',
    );

    GETPARAM:
    for my $Param ( sort keys %GetParam ) {

        # set dynamic fields values via url / link (DynamicField_NAME=ZnunyRocks;)
        next GETPARAM if $Param !~ m{^DynamicField_(.*)}xms;
        if ( $Param =~ m{^DynamicField_(.*)}xms ) {

            my $Value              = $GetParam{$Param} || '';
            my $DynamicFieldName   = $1;
            my $DynamicFieldConfig = ( grep { $_->{Name} eq $DynamicFieldName } @{$DynamicField} )[0];

            next GETPARAM if !defined $Value || !IsHashRefWithData($DynamicFieldConfig);

            $DynamicFieldBackendObject->ValueSet(
                DynamicFieldConfig => $DynamicFieldConfig,
                ObjectID           => $Self->{TicketID},
                Value              => $Value,
                UserID             => $Self->{UserID},
            );
        }
    }

    my $State = $GetParam{State} || $ConfigObject->Get('Znuny4OTRS::QuickClose::State');
    if ($State) {
        my $Success = $TicketObject->TicketStateSet(
            State    => $State,
            TicketID => $Self->{TicketID},
            UserID   => $Self->{UserID},
        );
        if ($Success) {
            $TicketObject->TicketLockSet(
                TicketID => $Self->{TicketID},
                Lock     => 'unlock',
                UserID   => $Self->{UserID},
            );
        }
    }

    return $LayoutObject->Redirect( OP => $Self->{LastScreenOverview} ) if !$Config->{Article};

    my $ArticleID = $ArticleObject->ArticleCreate(
        ChannelName          => $Config->{CommunicationChannel} || 'Internal',
        TicketID             => $Self->{TicketID},
        SenderType           => $Config->{SenderType} || 'agent',
        Subject              => $Config->{Subject} || 'Ticket closed',
        Body                 => $Config->{Body} || 'Ticket closed',
        From                 => $LayoutObject->{UserFullname},
        ContentType          => $Config->{ContentType} || 'text/plain; charset=utf-8',
        HistoryType          => $Config->{HistoryType} || 'AddNote',
        HistoryComment       => $Config->{HistoryComment} || 'Ticket was closed',
        IsVisibleForCustomer => $Config->{IsVisibleForCustomer} || '0',
        UserID               => $Self->{UserID},
    );

    return $LayoutObject->Redirect( OP => $Self->{LastScreenOverview} );
}

1;
