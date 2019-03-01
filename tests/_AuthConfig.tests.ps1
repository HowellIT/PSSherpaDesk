InModuleScope -ModuleName PSSherpaDesk {
    Describe 'AuthConfig' -Tag 'Auth' {
        Context 'Get' {
            It 'Get-SDAuthConfig should return data' {
                Get-SDAuthConfig | Should -Not -BeNullOrEmpty
            }
        }
        Context 'Save' {
            $dir = Get-SDSavePath
            $credFile = "$dir\credentials.json"
            It 'Save-SDAuthConfig should not error' {
                {Save-SDAuthConfig} | Should -Not -Throw
            }
            It 'credentials.json should exist' {
                Test-Path $credFile | Should -BeTrue
            }
            It 'credentials.json should have ApiKey, org, and instance' {
                $creds = Get-Content $credFile | ConvertFrom-Json
                $creds.ApiKey | Should -not -BeNullOrEmpty
                $creds.WorkingOrganization | Should -Not -BeNullOrEmpty
                $creds.WorkingInstance | Should -Not -BeNullOrEmpty
            }
        }
    }
}