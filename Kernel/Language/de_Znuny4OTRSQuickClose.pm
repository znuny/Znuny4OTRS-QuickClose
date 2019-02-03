﻿# --
# Kernel/Language/de_Znuny4OTRSQuickClose.pm - the german translation of the texts of Znuny4OTRS-QuickClose
# Copyright (C) 2012-2019 Znuny GmbH, http://znuny.com/
# Copyright (C) (2014) (Denny Bresch) (dennybresch@gmail.com) (https://github.com/dennybresch)
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_Znuny4OTRSQuickClose;

use strict;
use warnings;

use utf8;

sub Data {
    my $Self = shift;

    # SysConfig
    $Self->{Translation}->{'If enabled, the quick close action will create an article.'} = 'Wenn diese Option aktiviert ist, wird mit der Aktion Schnellschließen ein Artikel erstellt.';
    $Self->{Translation}->{'Defines the subject for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den Artikelbetreff für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the body for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den Artikeltext für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the article type for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den Artikeltyp für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the sender type for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den Sendertyp für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the content type for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den Content-Typ für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the history type for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den History-Typ für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the history comment for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den History-Kommentar für die Schnellschließaktion, der für die Ticket-Historie in der Agentenoberfläche verwendet wird.';

    # Frontend
    $Self->{Translation}->{'Quick Close'}       = 'sofort schließen';
    $Self->{Translation}->{'Ticket closed'}     = 'Ticket geschlossen';
    $Self->{Translation}->{'Ticket was closed'} = 'Ticket wurde geschlossen';

    return 1;
}

1;
