[cmdletbinding()]
param(
    [string[]]$Task = 'ModuleBuild'
)

$DependentModules = @('PSDeploy','InvokeBuild','PlatyPS') # add pester when pester tests are added
Foreach ($Module in $DependentModules){
    If (-not (Get-Module $module -ListAvailable)){
        Install-Module -name $Module -Scope CurrentUser -Force
    }
    Import-Module $module -ErrorAction Stop
}
if ((Get-Module pester -ListAvailable | Sort-Object version | Select-Object -Last 1).Version -lt 4.6){
    Install-Module 'Pester' -MinimumVersion 4.6 -Scope CurrentUser -Force
}
Import-Module 'Pester'
Get-Module 'Pester'
# Builds the module by invoking psake on the build.psake.ps1 script.
Invoke-Build "$PSScriptRoot\PSSherpaDesk.build.ps1" -Task $Task