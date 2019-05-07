---
external help file: PSSherpaDesk-help.xml
Module Name: PSSherpaDesk
online version:
schema: 2.0.0
---

# Get-SDProject

## SYNOPSIS
Returns projects from the SherpaDesk API

## SYNTAX

### ByKey
```
Get-SDProject [-Key <String>] [-Organization <String>] [-Instance <String>] [-ApiKey <String>]
 [<CommonParameters>]
```

### (Default)
```
Get-SDProject [-Organization <String>] [-Instance <String>] [-ApiKey <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns projects from the SherpaDesk API. Specify a project ID to get more information.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-SDProject

id                  : 0000
account_id          : -1
name                : Test project
account_name        : Howell IT
open_tickets        : 0
closed_tickets      : 0
priority            :
priority_name       :
logged_hours        : 0.0000
remaining_hours     : 0.0000
complete            : 0
client_manager      : Administrator, Anthony Howell
default_contract_id : 0
```

Returns all projects from your SherpaDesk.

### Example 2
```powershell
PS C:\> Get-SDProject -Key 0000

id                         : 0000
account_id                 : -1
name                       : Test project
full_name                  : Test project
account_name               : Howell IT
internal_project_manager   : Administrator, Anthony Howell
client_project_manager     :
priority                   :
priority_name              :
priority_description       :
support_group_name         :
estimated_hours            :
project_hours              : 0.0000
ticket_hours               : 0.0000
ticket_remaining_hours     : 0.0000
todo_project_estimated     : 0.0000
estimated_cost             :
ticket_invoice_amount      : 0.0000
project_invoice_amount     : 0.0000
total_invoice_amount       : 0.0000
ticket_noninvoiced_amount  : 0.0000
project_noninvoiced_amount : 0.0000
estimated_invoiced_amount  :
ticket_bill_amount         : 0.0000
project_bill_amount        : 0.0000
ticket_unbilled_amount     : 0.0000
project_unbilled_amount    : 0.0000
fb_project_id              : 0
fb_client_id               : 0
```

Returns more data about a single project.

## PARAMETERS

### -ApiKey
Your SherpaDesk API Key. This is passed automatically after:

- It is retrieved from the API with Get-SDApiKey.
- It is retrieved from local storage with Get-SDAuthConfig

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Instance
Your SherpaDesk instance. This is passed automatically after:

- It is retrieved from the API with Get-SDMetaData.
- It is retrieved from local storage with Get-SDAuthConfig

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Key
The ID of a specific project you'd like to retrieve.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Organization
Your SherpaDesk Organization. This is passed automatically after:

- It is retrieved from the API with Get-SDMetaData.
- It is retrieved from local storage with Get-SDAuthConfig

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
