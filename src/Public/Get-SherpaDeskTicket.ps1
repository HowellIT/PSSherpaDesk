Function Get-SherpaDeskTicket{
    Param(
        [string]$Organization,
        [string]$Instance,
        [string]$ApiKey
    )

    Invoke-SherpaDeskAPICall -Resource tickets -Method Get -Organization $Organization -Instance $Instance -ApiKey $ApiKey
}