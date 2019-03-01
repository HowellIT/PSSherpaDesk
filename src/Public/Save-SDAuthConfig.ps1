Function Save-SDAuthConfig {
    [cmdletbinding(
        DefaultParameterSetName = 'FromAuthConfig'
    )]
    Param(
        [parameter(
            ParameterSetName = 'Passed'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Organization,
        [parameter(
            ParameterSetName = 'Passed'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Instance,
        [parameter(
            ParameterSetName = 'Passed'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$ApiKey
    )
    $dir = Get-SDSavePath
    If(-not(Test-Path $dir -PathType Container)){
        New-Item $dir -ItemType Directory
    }
    If(-not(Test-Path $dir\credentials.json -PathType Leaf)){
        New-Item $dir\credentials.json -ItemType File
    }
    If($PSCmdlet.ParameterSetName -eq 'Passed'){
        $Script:AuthConfig = @{
            ApiKey = $ApiKey
            WorkingOrganization = $Organization
            WorkingInstance = $Instance
        }
    }
    $encryptedAuth = @{}
    ForEach($property in $AuthConfig.GetEnumerator()){
        $encryptedAuth."$($property.Name)" = (ConvertFrom-SecureString (ConvertTo-SecureString $property.Value -AsPlainText -Force))
    }
    $encryptedAuth | ConvertTo-Json | Set-Content $dir\credentials.json
}