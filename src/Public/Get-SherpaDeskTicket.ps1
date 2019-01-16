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