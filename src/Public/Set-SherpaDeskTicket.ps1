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

    $body = $body | ConvertTo-Json

    Write-Verbose $body

    Invoke-SherpaDeskAPICall -Method Put -Resource $resource -Organization $Organization -Instance $Instance -ApiKey $ApiKey -Body $body
}