---
external help file: PSSherpaDesk-help.xml
Module Name: PSSherpaDesk
online version:
schema: 2.0.0
---

# Get-SDAccount

## SYNOPSIS
Gets SherpaDesk accounts. which are groupings of users. Typically things like departments, clients, etc.

## SYNTAX

### ByKey
```
Get-SDAccount [-Key <String>] [-Organization <String>] [-Instance <String>] [-ApiKey <String>]
 [<CommonParameters>]
```

### (Default)
```
Get-SDAccount [-Organization <String>] [-Instance <String>] [-ApiKey <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Gets SherpaDesk accounts. Accounts in SherpaDesk are groupings of users. Typically things like departments, clients, etc.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-SDAccount

id                 : 00000
name               : Camping Supplies, Inc
task_types         :
projects           :
locations          :
account_statistics : @{ticket_counts=; timelogs=0; contracts=1; hours=2.0000; expenses=0}
```

This will return a listing of all accounts that you have set up in SherpaDesk

### Example 2
```powershell
PS C:\> Get-SDAccount -Key 00000

id                     : 00000
name                   : Camping Supplies, Inc
note                   :
is_active              : True
is_organization        : True
bwd_number             : 1005
client_contract_id     :
number                 :
ref1                   :
ref2                   :
representative_name    : Administrator, Anthony Howell
internal_location_name :
city                   :
state                  :
zipcode                :
country                :
phone1                 :
phone2                 :
address1               :
address2               :
email_suffix           :
fb_client_id           : 0
qb_customer_id         : 0
xero_contact_id        :
logo                   :
files                  :
locations              :
users                  : {}
projects               : {}
assets                 :
account_statistics     : @{ticket_counts=; timelogs=0; contracts=1; hours=2.0000; expenses=0}
primary_contact        :
customfields           : {}
```

This will return more data about the specified account.

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
The ID of a specific account you'd like to retrieve.

```yaml
Type: String
Parameter Sets: ByKey
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
