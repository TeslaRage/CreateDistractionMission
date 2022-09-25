Param(
    [string] $srcDirectory, # the path that contains your mod's .XCOM_sln
    [string] $sdkPath, # the path to your SDK installation ending in "XCOM 2 War of the Chosen SDK"
    [string] $gamePath, # the path to your XCOM 2 installation ending in "XCOM2-WaroftheChosen"
    [string] $config # build configuration
)

$ScriptDirectory = Split-Path $MyInvocation.MyCommand.Path
$common = Join-Path -Path $ScriptDirectory "X2ModBuildCommon\build_common.ps1"
Write-Host "Sourcing $common"
. ($common)

$builder = [BuildProject]::new("CreateDistractionMission", $srcDirectory, $sdkPath, $gamePath)

$workshopDirectory = "F:\SteamLibrary\steamapps\workshop\content\268500"

$builder.IncludeSrc("$workshopDirectory\1796402257\Src")	#CHL BETA
$builder.IncludeSrc("$workshopDirectory\1529472981\Src")	#OSSAAT
#$builder.IncludeSrc("$workshopDirectory\2534737016\Src")
$builder.IncludeSrc("$workshopDirectory\2567230730\Src")	#CI

switch ($config)
{
    "debug" {
        $builder.EnableDebug()
    }
    "default" {
        # Nothing special
    }
    "" { ThrowFailure "Missing build configuration" }
    default { ThrowFailure "Unknown build configuration $config" }
}

$builder.InvokeBuild()