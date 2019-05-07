---
external help file: PSSherpaDesk-help.xml
Module Name: PSSherpaDesk
online version:
schema: 2.0.0
---

# Get-SDTechs

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
Get-SDTechs [[-Organization] <String>] [[-Instance] <String>] [[-ApiKey] <String>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

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
Position: 2
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
Position: 1
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
Position: 0
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
