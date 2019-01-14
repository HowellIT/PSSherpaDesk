Function Get-SherpaDeskTicket{
    Param(
        [string]$Organization = $authConfig.WorkingOrganization,
        [string]$Instance = $authConfig.WorkingInstance,
        [string]$ApiKey = $authConfig.ApiKey
    )

    Invoke-SherpaDeskAPICall -Resource tickets -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}