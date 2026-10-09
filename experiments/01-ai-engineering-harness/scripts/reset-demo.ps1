param([switch]$ActualizarPlantilla)

$ErrorActionPreference = "Stop"
$ExperimentRoot = Split-Path -Parent $PSScriptRoot
$Template = Join-Path $ExperimentRoot "template"
$ExpectedTarget = [System.IO.Path]::GetFullPath("C:\Evolium\webinar-experiment-01-live")

if (-not (Test-Path $ExpectedTarget)) { throw "Demo workspace does not exist: $ExpectedTarget" }

Push-Location $ExpectedTarget
try {
    $Root = (git rev-parse --show-toplevel 2>$null)
    if (-not $Root) { throw "Target is not a Git repository." }

    $ActualRoot = [System.IO.Path]::GetFullPath($Root.Trim())
    if ($ActualRoot.TrimEnd('\') -ne $ExpectedTarget.TrimEnd('\')) {
        throw "Safety check failed. Expected '$ExpectedTarget' but found '$ActualRoot'."
    }

    git rev-parse --verify demo-baseline 1>$null 2>$null
    if ($LASTEXITCODE -ne 0) { throw "Tag demo-baseline is missing." }

    git reset --hard demo-baseline | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "No se pudo restaurar la linea base." }
    git clean -fd | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "No se pudo limpiar el workspace." }

    if ($ActualizarPlantilla) {
        if (-not (Test-Path $Template)) { throw "No existe la plantilla: $Template" }
        Get-ChildItem -LiteralPath $Template -Force | Copy-Item -Destination $ExpectedTarget -Recurse -Force
        git add -A
        if ($LASTEXITCODE -ne 0) { throw "No se pudo agregar la plantilla." }
        git diff --cached --quiet
        if ($LASTEXITCODE -ne 0) {
            git -c commit.gpgsign=false commit -m "demo: baseline con politica empresarial" | Out-Host
            if ($LASTEXITCODE -ne 0) { throw "No se pudo registrar la nueva linea base." }
            git tag -f demo-baseline | Out-Host
            if ($LASTEXITCODE -ne 0) { throw "No se pudo actualizar el tag." }
        }
        Write-Host "Linea base actualizada con la nueva plantilla."
    } else {
        Write-Host "Demo reset to demo-baseline."
    }
} finally {
    Pop-Location
}
