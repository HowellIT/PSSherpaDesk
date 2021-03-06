﻿Function Get-SDAccount{
    Param(
        [parameter(
            ParameterSetName = 'ByKey'
        )]
        [string]$Key,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )

    $resource = 'accounts'
    If($PSCmdlet.ParameterSetName -eq 'ByKey'){
        $resource = "$resource/$key"
    }

    Invoke-SherpaDeskAPICall -Resource $resource -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}
Function Get-SDAPIKey {
    [cmdletbinding(
        DefaultParameterSetName = 'EmailOnly'
    )]
    Param(
        [Parameter(
            ParameterSetName = 'EmailOnly'
        )]
        [string]$Email,
        [Parameter(
            ParameterSetName = 'Credential'
        )]
        [pscredential]$Credential,
        [switch]$PassThru
    )

    If($PSCmdlet.ParameterSetName -eq 'EmailOnly'){
        $credential = Get-Credential -UserName $Email -Message 'Retrieving API key from Sherpa Desk'
    }

    $up = "$($credential.GetNetworkCredential().UserName)`:$($credential.GetNetworkCredential().Password)"
    $encodedUP = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$up"))

    $header = @{
        Authorization = "Basic $encodedUP"
        Accept = 'application/json'
    }
    $resp = Invoke-RestMethod -Method Get -Uri 'https://api.sherpadesk.com/login' -Headers $header
    $Script:AuthConfig = @{
        ApiKey = $resp.api_token
        WorkingOrganization = ''
        WorkingInstance = ''
    }
    If($PassThru.IsPresent){
        $resp.api_token
    }
}
Function Get-SDAuthConfig {
    Param(
        [switch]$Silent
    )
    If($AuthConfig){
        If(-not ($Silent.IsPresent)){
            $AuthConfig
        }
    }Else{
        $dir = Get-SDSavePath
        If(Test-Path $dir\credentials.json){
            $encryptedAuth = Get-Content $dir\credentials.json | ConvertFrom-Json
        }
        $script:AuthConfig = @{}
        ForEach($property in $encryptedAuth.psobject.Properties){
            $AuthConfig."$($property.name)" = [pscredential]::New('user',(ConvertTo-SecureString $property.value)).GetNetworkCredential().password
        }
        If(-not ($Silent.IsPresent)){
            $AuthConfig
        }
    }
}
Function Get-SDMetadata {
    Param(
        [string]$ApiKey = $AuthConfig.ApiKey,
        [switch]$PassThru
    )
    
    $encodedAuth = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("x:$ApiKey"))

    $header = @{
        Authorization = "Basic $encodedAuth"
        Accept = 'application/json'
    }

    $resp = Invoke-RestMethod -Uri 'https://api.sherpadesk.com/organizations/' -Method Get -Headers $header
    $Script:AuthConfig.WorkingOrganization = $resp[0].key
    $Script:AuthConfig.WorkingInstance = $resp[0].instances[0].key
    If($PassThru.IsPresent){
        $resp
    }
}
Function Get-SDProject {
    [cmdletbinding()]
    Param(
        [parameter(
            ParameterSetName = 'ByKey'
        )]
        [string]$Key,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $resource = 'projects'
    If($PSCmdlet.ParameterSetName -eq 'ByKey'){
        $resource = "$resource/$key"
    }

    Invoke-SherpaDeskAPICall -Resource $resource -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}
Function Get-SDTaskTypes {
    [cmdletbinding()]
    Param(
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $resource = 'task_types'

    Invoke-SherpaDeskAPICall -Resource $resource -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}
Function Get-SDTechs {
    [cmdletbinding()]
    Param(
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $resource = 'technicians'

    Invoke-SherpaDeskAPICall -Resource $resource -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}
Function Get-SDTicket{
    [cmdletbinding()]
    Param(
        [parameter(
            ParameterSetName = 'ByKey'
        )]
        [string]$Key,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $resource = 'tickets'
    If($PSCmdlet.ParameterSetName -eq 'ByKey'){
        $resource = "$resource/$key"
    }

    Invoke-SherpaDeskAPICall -Resource $resource -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}
Function Get-SDTime {
    [cmdletbinding()]
    Param(
        [string]$Account,
        [string]$Tech,
        [string]$Project,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $arrParameters = @()
    If($AccountName){
        $arrParameters += "account=$AccountName"
    }
    If($Tech){
        $arrParameters += "tech=$Tech"
    }
    If($Project){
        $arrParameters += "project=$Project"
    }
    $strParameters = $arrParameters -join '&'
    
    Write-Verbose $strParameters

    If($strParameters){
        Invoke-SherpaDeskAPICall -Resource "time?$strParameters" -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
    }Else{
        Invoke-SherpaDeskAPICall -Resource time -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
    }
}
Function Get-SDUser {
    [cmdletbinding()]
    Param(
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $resource = 'users'

    Invoke-SherpaDeskAPICall -Resource $resource -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}
Function New-SDTicket {
    [cmdletbinding(
        DefaultParameterSetName = 'ByParameter'
    )]
    Param(
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [string]$Status,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [string]$Subject,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [string]$FirstPost,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [int]$Class,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [int]$Account,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [int]$Location,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [int]$User,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [int]$Tech,
        [Parameter(
            ParameterSetName = 'ByBody'
        )]
        [hashtable]$Body,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $NewTicketParams = @{
        Status = 'status'
        Subject = 'subject'
        FirstPost = 'initial_post'
        Class = 'class_id'
        Account = 'account_id'
        Location = 'location_id'
        User = 'user_id'
        Tech = 'tech_id'
    }

    $resource = "tickets"
    
    If($PSCmdlet.ParameterSetName -eq 'ByParameter'){
        $body = @{}
        ForEach($param in $NewTicketParams.GetEnumerator()){
            If($PSBoundParameters.ContainsKey($param.key)){
                $body["$($param.value)"] = $PSBoundParameters["$($param.key)"]
            }
        }
    }

    $jsonbody = $body | ConvertTo-Json

    Write-Verbose $jsonbody

    Invoke-SherpaDeskAPICall -Method Post -Resource $resource -Organization $Organization -Instance $Instance -ApiKey $ApiKey -Body $jsonbody
}
Function New-SDUser {
    Param(
        [Parameter(
            ParameterSetName = 'ByParameter',
            Mandatory = $true
        )]
        [string]$FirstName,
        [Parameter(
            ParameterSetName = 'ByParameter',
            Mandatory = $true
        )]
        [string]$LastName,
        [Parameter(
            ParameterSetName = 'ByParameter',
            Mandatory = $true
        )]
        [string]$Email,
        [Parameter(
            ParameterSetName = 'ByParameter',
            Mandatory = $true
        )]
        [int]$Account,
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [int]$Location,
        [Parameter(
            ParameterSetName = 'ByBody'
        )]
        [hashtable]$Body,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $NewUserParams = @{
        FirstName = 'firstname'
        LastName = 'lastname'
        Email = 'email'
        Account = 'account'
        Location = 'location'
    }

    $resource = 'users'

    If($PSCmdlet.ParameterSetName -eq 'ByParameter'){
        $body = @{}
        ForEach($param in $NewUserParams.GetEnumerator()){
            If($PSBoundParameters.ContainsKey($param.key)){
                $body["$($param.value)"] = $PSBoundParameters["$($param.key)"]
            }
        }
    }

    $jsonbody = $body | ConvertTo-Json

    Write-Verbose $jsonbody

    Invoke-SherpaDeskAPICall -Method Post -Resource $resource -Organization $Organization -Instance $Instance -ApiKey $ApiKey -Body $jsonbody
}
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
Function Set-SDTicket {
    [cmdletbinding(
        DefaultParameterSetName = 'ByParameter'
    )]
    Param(
        [Parameter(
            ParameterSetName = 'ByParameter'
        )]
        [string]$Status,
        [Parameter(
            ParameterSetName = 'ByBody'
        )]
        [hashtable]$Body,
        [string]$key,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $resource = "tickets/$key"
    
    If($PSCmdlet.ParameterSetName -eq 'ByParameter'){
        $body = @{}
        $body['status'] = $Status
    }

    $jsonbody = $body | ConvertTo-Json

    Write-Verbose $jsonbody

    Invoke-SherpaDeskAPICall -Method Put -Resource $resource -Organization $Organization -Instance $Instance -ApiKey $ApiKey -Body $jsonbody
}
Function Get-SDSavePath {
    Param (

    )
    If($PSVersionTable.PSVersion.Major -ge 6){
        # PS Core
        If($IsLinux){
            $saveDir = $env:HOME
        }ElseIf($IsWindows){
            $saveDir = $env:USERPROFILE
        }
    }Else{
        # Windows PS
        $saveDir = $env:USERPROFILE
    }
    "$saveDir\.pssherpadesk"
}
Function Invoke-SherpaDeskAPICall {
    Param(
        [string]$Resource,
        [ValidateSet('Get','Put','Post')]
        [string]$Method,
        [string]$Body,
        [string]$Organization,
        [string]$Instance,
        [string]$ApiKey
    )
    $baseUri = 'https://api.sherpadesk.com'

    $encodedAuth = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$Organization-$Instance`:$ApiKey"))

    $header = @{
        Authorization = "Basic $encodedAuth"
        Accept = 'application/json'
    }
    
    If($Method -eq 'Get'){
        Invoke-RestMethod -Method $Method -Uri "$baseUri/$Resource" -Headers $header
    }ElseIf(@('Post','Put') -contains $Method){
        Invoke-RestMethod -Method $Method -Uri "$baseUri/$Resource" -Headers $header -ContentType 'application/json' -Body $Body
    }
}
