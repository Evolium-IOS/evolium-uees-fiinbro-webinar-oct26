$ErrorActionPreference = "Stop"

$ExperimentRoot = Split-Path -Parent $PSScriptRoot
$AppRoot = Join-Path $ExperimentRoot "app"
$Streamlit = Join-Path $AppRoot ".venv\Scripts\streamlit.exe"

if (-not (Test-Path $Streamlit)) {
    throw "Entorno no preparado. Ejecuta primero .\scripts\preparar-entorno.ps1"
}

if (-not (Test-Path (Join-Path $AppRoot ".env"))) {
    throw "Falta app\.env. Ejecuta preparar-entorno.ps1 y configura OPENAI_API_KEY."
}

Push-Location $AppRoot
try {
    & $Streamlit run app/ui_streamlit.py
} finally {
    Pop-Location
}
