Function Get-SherpaDeskAPIKey {
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
Function Get-SherpaDeskMetadata {
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
Function Get-SherpaDeskTicket{
    Param(
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )

    Invoke-SherpaDeskAPICall -Resource tickets -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}
<#
https://github.com/sherpadesk/api/wiki
https://documenter.getpostman.com/view/4454237/apisherpadeskcom-playground/RW8AooQg
https://github.com/ThePoShWolf/PSSherpaDesk

I do not endorsing or promoting this product and nor am I being endorsed, sponsored, or otherwise compensated to stream this product.

I am streaming this because I enjoy building PS Modules to interact with APIs.

# [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("")
#>

<# Goals
Essentially streamlining my invoicing:
 - Retrieve API key from API
 - Authenticate
 - Get Tickets
 - Associate tickets to 'Accounts' (clients, departments, etc)
 - Get Time worked
#>
Function Invoke-SherpaDeskAPICall {
    Param(
        [string]$Resource,
        [ValidateSet('Get')]
        [string]$Method,
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

    Invoke-RestMethod -Method $Method -Uri "$baseUri/$Resource" -Headers $header
}
Function New-SherpaDeskAuthConfig {
    Param(

    )

}
