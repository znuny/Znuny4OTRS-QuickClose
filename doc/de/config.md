# Konfiguration

Sie können in der SysConfig folgende Einstellungen am Ticket durch Nutzung der Quick-Close-Funktion konfigurieren:

## Article
`Znuny4OTRSQuickClose###Article`

Wenn diese Option aktiviert ist, wird mit der Aktion Schnellschließen ein Artikel erstellt.

## Subject
`Znuny4OTRSQuickClose###Subject`

Definiert den Artikelbetreff für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.

## Body
`Znuny4OTRSQuickClose###Body`

Definiert den Artikeltext für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.

## ArticleType
`Znuny4OTRSQuickClose###ArticleType`

Definiert den Artikeltyp für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.

## SenderType
`Znuny4OTRSQuickClose###SenderType`

Definiert den Sendertyp für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.

## ContentType
`Znuny4OTRSQuickClose###ContentType`

Definiert den Content-Typ für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.

## HistoryType
`Znuny4OTRSQuickClose###HistoryType`

Definiert den History-Typ für die Schnellschließaktion, der für die Tickethistorie in der Agentenoberfläche verwendet wird.

## HistoryComment
`Znuny4OTRSQuickClose###HistoryComment`

Definiert den History-Kommentar für die Schnellschließaktion, der für die Ticket-Historie in der Agentenoberfläche verwendet wird.

## Znuny4OTRS::QuickClose::State
Definiert den Status, der am Ticket durch die Quick-Close Funktion gespeichert wird. Die Grundeinstellung ist 'closed successful'.

## Dynamische Felder

In den folgenden SysConfigs, kann der Wert 'Link' so erweitert werden, dass dynamische Felder direkt per Klick befüllt werden.

- Ticket::Frontend::MenuModule###451-QuickClose
- Ticket::Frontend::MenuModule###452-QuickClose
- Ticket::Frontend::MenuModule###453-QuickClose
- Ticket::Frontend::MenuModule###454-QuickClose
- Ticket::Frontend::MenuModule###455-QuickClose
- Ticket::Frontend::PreMenuModule###441-QuickClose
- Ticket::Frontend::PreMenuModule###442-QuickClose
- Ticket::Frontend::PreMenuModule###443-QuickClose
- Ticket::Frontend::PreMenuModule###444-QuickClose
- Ticket::Frontend::PreMenuModule###445-QuickClose

Beispiel:

Der folgende Link setzt das dynamische Feld 'Znuny1' auf 'leer' und das dynamische Feld 'Znuny2' auf '2'.

```
Action=AgentTicketZnuny4OTRSQuickClose;TicketID=[% Data.TicketID | html %];DynamicField_Znuny1=;DynamicField_Znuny2=2;
```

Weitere Beispiele:

- DynamicField_Checkbox=1;
- DynamicField_Date=2020-02-20;
- DynamicField_DateTime=2020-02-20 12:25:08;
- DynamicField_Dropdown=Key 1;
- DynamicField_Multiselect=Key 1;
- DynamicField_Text=SomeText;
- DynamicField_Textarea=SomeText;

```
Action=AgentTicketZnuny4OTRSQuickClose;TicketID=[% Data.TicketID | html %];DynamicField_Checkbox=1;DynamicField_Date=2020-02-20;DynamicField_DateTime=2020-02-20 12:25:08;DynamicField_Dropdown=Key 1;DynamicField_Multiselect=Key 1;DynamicField_Text=SomeText;DynamicField_Textarea=SomeText;
```
