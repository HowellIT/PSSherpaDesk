---
external help file: PSSherpaDesk-help.xml
Module Name: PSSherpaDesk
online version:
schema: 2.0.0
---

# Get-SDMetadata

## SYNOPSIS
Returns your instances and organizations from the SherpaDesk API.

## SYNTAX

```
Get-SDMetadata [[-ApiKey] <String>] [-PassThru]
```

## DESCRIPTION
Returns all of your instances and organizations from the SherpaDesk API and stores them in a module scoped variable to share with all member cmdlets.

If run after Get-SDApiKey or, if the credentials have been previously saved with Save-SDAuthConfig, Get-SDAuthConfig, then this cmdlet will automatically use the stored API key.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-SDMetadata
```

This returns and stores the instance and organization information from the SherpaDesk API.

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
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
{{Fill PassThru Description}}

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

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
