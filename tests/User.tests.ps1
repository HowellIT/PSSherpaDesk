Describe 'Users' -Tag 'Users' {
    $guid = (New-Guid) -replace '-',''
    $userParams = @{
        FirstName = 'Pester'
        LastName = 'Tester'
        Account = '-1'
        Email = "$guid@howell-it.com"
    }
    $user = New-SDUser @userParams
    Context 'New' {
        It 'New-SDUser should create a user' {
            $user | Should -Not -BeNullOrEmpty
        }
        It 'New-SDUser should throw an error on duplicate user' {
            {New-SDUser @userParams} | Should -Throw
        }
    }
    Context 'Get' {
        It 'Get-SDUser should return data' {
            $users = Get-SDUser
            $users | Should -Not -BeNullOrEmpty
        }
    }
}