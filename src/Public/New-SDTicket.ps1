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