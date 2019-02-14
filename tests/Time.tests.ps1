Describe 'Time' -Tag 'Time' {
    $testTech = '950330'
    $times = Get-SDTime
    Context 'Get' {
        It 'Get-SDTime should return data' {
            $times | Should -Not -BeNullOrEmpty
        }
        It 'Get-SDTime -Tech should return data' {
            $time = Get-SDTime -Tech $testTech
            $time | Should -Not -BeNullOrEmpty
        }
        It 'Get-SDTime -Account should return data' {
            $time = Get-SDTime -Account -1
            $time | Should -Not -BeNullOrEmpty
        }
    }
}