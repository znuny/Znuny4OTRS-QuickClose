# Configuration

The following settings can be defined via System Configuration, when using the quick close function:

## State
`Znuny4OTRS::QuickClose::State`

You can configure the state which is set via SysConfig. The default state is 'closed successful'.

#### Article
`Znuny4OTRSQuickClose###Article`

If enabled, the quick close action will create an article.

#### Subject
`Znuny4OTRSQuickClose###Subject`

Defines the subject for the quick close action, which gets used for ticket history in the agent interface.

#### Body
`Znuny4OTRSQuickClose###Body`

Defines the body for the quick close action, which gets used for ticket history in the agent interface.

#### ArticleType
`Znuny4OTRSQuickClose###ArticleType`

Defines the article type for the quick close action, which gets used for ticket history in the agent interface.

#### SenderType
`Znuny4OTRSQuickClose###SenderType`

Defines the sender type for the quick close action, which gets used for ticket history in the agent interface.

#### ContentType
`Znuny4OTRSQuickClose###ContentType`

Defines the content type for the quick close action, which gets used for ticket history in the agent interface.

#### HistoryType
`Znuny4OTRSQuickClose###HistoryType`

Defines the history type for the quick close action, which gets used for ticket history in the agent interface.

#### HistoryComment
`Znuny4OTRSQuickClose###HistoryComment`

Defines the history comment for the quick close action, which gets used for ticket history in the agent interface.

## Dynamic fields

In the following SysConfigs, the value 'Link' can be extended so that dynamic fields can be filled directly by clicking on it.

- Ticket::Frontend::MenuModule####451-QuickClose
- Ticket::Frontend::MenuModule####452-QuickClose
- Ticket::Frontend::MenuModule####453-QuickClose
- Ticket::Frontend::MenuModule####454-QuickClose
- Ticket::Frontend::MenuModule####455-QuickClose
- Ticket::Frontend::PreMenuModule####441-QuickClose
- Ticket::Frontend::PreMenuModule####442-QuickClose
- Ticket::Frontend::PreMenuModule####443-QuickClose
- Ticket::Frontend::PreMenuModule####444-QuickClose
- Ticket::Frontend::PreMenuModule####445-QuickClose

Example:

The following link sets the dynamic field 'Znuny1' to 'empty' and the dynamic field 'Znuny2' to '2'.

```
Action=AgentTicketZnuny4OTRSQuickClose;TicketID=[% Data.TicketID | html %];DynamicField_Znuny1=;DynamicField_Znuny2=2;
```

Further Examples:

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
