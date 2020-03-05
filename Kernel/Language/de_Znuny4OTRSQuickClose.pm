# --
# Kernel/Language/de_Znuny4OTRSQuickClose.pm - the german translation of the texts of Znuny4OTRS-QuickClose
# Copyright (C) 2012-2020 Znuny GmbH, http://znuny.com/
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
    $Self->{Translation}->{'Defines the close state for quick close.'} = 'Definiert den Schließzustand für das schnelle Schließen.';
    $Self->{Translation}->{"Defines which items are available for 'Action' in third level of the ACL structure."} = "Definiert, welche Elemente für 'Aktion' in der dritten Ebene der ACL-Struktur zur Verfügung stehen.";
    $Self->{Translation}->{'Frontend module registration for the agent interface.'} = 'Registrierung des Frontend-Moduls für die Agentenschnittstelle.';
    $Self->{Translation}->{'Sets the default article customer visibility for quick close action in the agent interface.'} = 'Legt die Standardartikel-Kundentransparenz für schnelle Schließvorgänge in der Agentenoberfläche fest.';
    $Self->{Translation}->{'Shows a link in the menu to quick close a ticket in every ticket overview of the agent interface.'} = 'Zeigt einen Link im Menü an, um ein Ticket in jeder Ticketübersicht der Agentenoberfläche schnell zu schließen.';
    $Self->{Translation}->{'Shows a link in the menu to quick close a ticket in the ticket zoom view of the agent interface.'}  = 'Zeigt einen Link im Menü an, um ein Ticket in der Ticket-Zoom-Ansicht der Agentenoberfläche schnell zu schließen.';
    $Self->{Translation}->{'If enabled, the quick close action will create an article.'} = 'Wenn diese Option aktiviert ist, wird mit der Aktion Schnellschließen ein Artikel erstellt.';
    $Self->{Translation}->{'Defines the subject for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den Artikelbetreff für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the body for the quick close action, which gets used for ticket history in the agent interface.'} = 'Definiert den Artikeltext für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.';
    $Self->{Translation}->{'Defines the communication chanel for the quick close article action.'} = 'Definiert den Kommunikationskanal für die Schnellschließung von Artikeln.';
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
