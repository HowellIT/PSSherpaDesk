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