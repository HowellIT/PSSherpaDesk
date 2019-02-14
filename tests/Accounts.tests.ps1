Describe 'Accounts' -Tag 'Accounts' {
    $accounts = Get-SDAccount
    Context 'Get' {
        It 'Get-SDAccount should return data' {
            $accounts | Should -Not -BeNullOrEmpty
        }
        It 'Get-SDAccount -key should return data' {
            $account = Get-SDAccount -key $accounts[0].id
            $account | Should -Not -BeNullOrEmpty
        }
        It 'Get-SDAccount -key should throw on bad key' {
            {Get-SDAccount -key (Get-Guid)} | Should -Throw
        }
    }
}