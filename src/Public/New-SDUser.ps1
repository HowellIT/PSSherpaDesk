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