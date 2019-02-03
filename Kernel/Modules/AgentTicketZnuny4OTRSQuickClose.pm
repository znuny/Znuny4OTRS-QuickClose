# --
# Copyright (C) 2012-2019 Znuny GmbH, http://znuny.com/
# Copyright (C) (2014) (Denny Bresch) (dennybresch@gmail.com) (https://github.com/dennybresch)
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentTicketZnuny4OTRSQuickClose;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Ticket',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

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

    my $State = $ConfigObject->Get('Znuny4OTRS::QuickClose::State');
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

    my $Config = $ConfigObject->Get('Znuny4OTRSQuickClose');

    return $LayoutObject->Redirect( OP => $Self->{LastScreenOverview} ) if !$Config->{Article};

    $TicketObject->ArticleCreate(
        TicketID       => $Self->{TicketID},
        ArticleType    => $Config->{ArticleType} || 'note-internal',
        SenderType     => $Config->{SenderType} || 'agent',
        Subject        => $Config->{Subject} || 'Ticket closed',
        Body           => $Config->{Body} || 'Ticket closed',
        From           => $LayoutObject->{UserFullname},
        ContentType    => $Config->{ContentType} || 'text/plain; charset=utf-8',
        HistoryType    => $Config->{HistoryType} || 'AddNote',
        HistoryComment => $Config->{HistoryComment} || 'Ticket was closed',
        UserID         => $Self->{UserID},
    );

    return $LayoutObject->Redirect( OP => $Self->{LastScreenOverview} );
}

1;
