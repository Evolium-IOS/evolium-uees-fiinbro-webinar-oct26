$ErrorActionPreference = "Stop"
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
    git clean -fd | Out-Host
    Write-Host "Demo reset to demo-baseline."
} finally {
    Pop-Location
}
