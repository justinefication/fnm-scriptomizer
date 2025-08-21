$nodeVersion = & "../src/fnm-node.bat" --version
$exitCode = $LASTEXITCODE

if ($exitCode -ne 0) {
    Write-Output "An error occurred."
}

if ([bool] ($nodeVersion -match "^v(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$")) {
    Write-Output "Matches Semantic Versioning"
    Write-Output "Node.js Version: $($nodeVersion)"
}