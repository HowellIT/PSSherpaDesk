Function Get-SDAuthConfig {
    Param(
        [switch]$Silent
    )
    If($AuthConfig){
        If(-not ($Silent.IsPresent)){
            $AuthConfig
        }
    }Else{
        $dir = Get-SDSavePath
        If(Test-Path $dir\credentials.json){
            $encryptedAuth = Get-Content $dir\credentials.json | ConvertFrom-Json
        }
        $script:AuthConfig = @{}
        ForEach($property in $encryptedAuth.psobject.Properties){
            $AuthConfig."$($property.name)" = [pscredential]::New('user',(ConvertTo-SecureString $property.value)).GetNetworkCredential().password
        }
        If(-not ($Silent.IsPresent)){
            $AuthConfig
        }
    }
}