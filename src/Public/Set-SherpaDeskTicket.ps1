Function Set-SherpaDeskTicket {
    [cmdletbinding()]
    Param(
        [string]$Status,
        [string]$key,
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )
    $resource = "tickets/$key"
    
    $body = @{}
    $body['status'] = $Status

    $body = $body | ConvertTo-Json

    Write-Verbose $body

    Invoke-SherpaDeskAPICall -Method Put -Resource $resource -Organization $Organization -Instance $Instance -ApiKey $ApiKey -Body $body
}