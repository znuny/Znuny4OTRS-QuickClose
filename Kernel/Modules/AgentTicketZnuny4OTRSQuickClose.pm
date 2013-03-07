#
# Copyright (C) 2013 Znuny GmbH, http://znuny.com/
#

package Kernel::Modules::AgentTicketZnuny4OTRSQuickClose;

use strict;
use warnings;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # check needed objects
    for (qw(ParamObject DBObject LayoutObject LogObject ConfigObject QueueObject TimeObject TicketObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Self->{TicketID} ) {
        return $Self->{LayoutObject}->ErrorScreen(
            Message => 'No TicketID is given!',
            Comment => 'Please contact the admin.',
        );
    }

    # check permissions
    my $Access = $Self->{TicketObject}->TicketPermission(
        Type     => 'close',
        TicketID => $Self->{TicketID},
        UserID   => $Self->{UserID}
    );

    # error screen, don't show ticket
    if ( !$Access ) {
        return $Self->{LayoutObject}->NoPermission(
            Message    => "You need $Self->{Config}->{Permission} permissions!",
            WithHeader => 'yes',
        );
    }

    my $State = $Self->{ConfigObject}->Get('Znuny4OTRS::QuickClose::State');
    if ($State) {
        my $Success = $Self->{TicketObject}->TicketStateSet(
            State    => $State,
            TicketID => $Self->{TicketID},
            UserID   => $Self->{UserID},
        );
        if ($Success) {
            $Self->{TicketObject}->TicketLockSet(
                TicketID => $Self->{TicketID},
                Lock     => 'unlock',
                UserID   => $Self->{UserID},
            );
        }
    }
    return $Self->{LayoutObject}->Redirect( OP => $Self->{LastScreenOverview} );
}
1;

