$ErrorActionPreference = "Stop"

$ExperimentRoot = Split-Path -Parent $PSScriptRoot
$AppRoot = Join-Path $ExperimentRoot "app"

Push-Location $AppRoot
try {
    if (-not (Test-Path ".venv")) {
        python -m venv .venv
    }

    $Python = Join-Path $AppRoot ".venv\Scripts\python.exe"
    & $Python -m pip install --upgrade pip
    & $Python -m pip install -r requirements.txt

    if (-not (Test-Path ".env")) {
        Copy-Item ".env.example" ".env"
        Write-Host ""
        Write-Host "Se creó app\.env."
        Write-Host "Completa OPENAI_API_KEY antes de ejecutar la demo."
    }

    Write-Host ""
    Write-Host "Entorno preparado."
} finally {
    Pop-Location
}
