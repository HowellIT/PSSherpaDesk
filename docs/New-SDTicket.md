---
external help file: PSSherpaDesk-help.xml
Module Name: PSSherpaDesk
online version:
schema: 2.0.0
---

# New-SDTicket

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

### ByParameter (Default)
```
New-SDTicket [-Status <String>] [-Subject <String>] [-FirstPost <String>] [-Class <Int32>] [-Account <Int32>]
 [-Location <Int32>] [-User <Int32>] [-Tech <Int32>] [-Organization <String>] [-Instance <String>]
 [-ApiKey <String>] [<CommonParameters>]
```

### ByBody
```
New-SDTicket [-Body <Hashtable>] [-Organization <String>] [-Instance <String>] [-ApiKey <String>]
 [<CommonParameters>]
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

### -Account
{{Fill Account Description}}

```yaml
Type: Int32
Parameter Sets: ByParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -Body
{{Fill Body Description}}

```yaml
Type: Hashtable
Parameter Sets: ByBody
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Class
{{Fill Class Description}}

```yaml
Type: Int32
Parameter Sets: ByParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstPost
{{Fill FirstPost Description}}

```yaml
Type: String
Parameter Sets: ByParameter
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

### -Location
{{Fill Location Description}}

```yaml
Type: Int32
Parameter Sets: ByParameter
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

### -Status
{{Fill Status Description}}

```yaml
Type: String
Parameter Sets: ByParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subject
{{Fill Subject Description}}

```yaml
Type: String
Parameter Sets: ByParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tech
{{Fill Tech Description}}

```yaml
Type: Int32
Parameter Sets: ByParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User
{{Fill User Description}}

```yaml
Type: Int32
Parameter Sets: ByParameter
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
