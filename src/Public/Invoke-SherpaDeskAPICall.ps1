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
        [ValidateSet('Get','Put')]
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
    }ElseIf($Method -eq 'Put'){
        Invoke-RestMethod -Method $Method -Uri "$baseUri/$Resource" -Headers $header -ContentType 'application/json' -Body $Body
    }
}