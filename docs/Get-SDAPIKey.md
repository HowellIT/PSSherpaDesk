---
external help file: PSSherpaDesk-help.xml
Module Name: PSSherpaDesk
online version:
schema: 2.0.0
---

# Get-SDAPIKey

## SYNOPSIS
Returns your API Key from the SherpaDesk API.

## SYNTAX

### EmailOnly (Default)
```
Get-SDAPIKey [-Email <String>] [-PassThru] [<CommonParameters>]
```

### Credential
```
Get-SDAPIKey [-Credential <PSCredential>] [-PassThru] [<CommonParameters>]
```

## DESCRIPTION
With your email and password, Get-SDApiKey can return your API key and store it to a module scoped variable for automatic usage in all member cmdlets.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-SDApiKey -Email 'anthony@howell-it.com'
```

This example will prompt you for a password and silently store the API key to share with member cmdlets.

### Example 2
```powershell
PS C:\> $cred = New-Credential
PS C:\> Get-SDApiKey -Credential $cred -PassThru

ge5sd840hgmeocxjcy6tc58g2egitxks
```

This example will store the API key to share with member cmdlets and output it as a string.

## PARAMETERS

### -Credential
A credential object with your SherpaDesk account email and password.

```yaml
Type: PSCredential
Parameter Sets: Credential
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
Your SherpaDesk account email.

```yaml
Type: String
Parameter Sets: EmailOnly
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Specify if you'd like your API key output to the console.

```yaml
Type: SwitchParameter
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
