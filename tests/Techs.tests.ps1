Describe 'Techs' -Tag 'Techs' {
    $techs = Get-SDTechs
    Context 'Get' {
        It 'Get-SDTechs should return data' {
            $techs | Should -Not -BeNullOrEmpty
        }
    }
}