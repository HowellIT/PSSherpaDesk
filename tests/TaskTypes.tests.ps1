Describe 'TaskTypes' -Tag 'TaskTypes' {
    $taskTypes = Get-SDTaskTypes
    Context 'Get' {
        It 'Get-SDTaskTypes should return data' {
            $taskTypes | Should -Not -BeNullOrEmpty
        }
    }
}