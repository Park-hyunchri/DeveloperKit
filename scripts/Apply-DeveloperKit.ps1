[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory = $true)][string]$ProjectPath, [Parameter(Mandatory = $true)][string]$DeveloperKitPath)
$ProjectPath = (Resolve-Path -LiteralPath $ProjectPath -ErrorAction Stop).Path
$DeveloperKitPath = (Resolve-Path -LiteralPath $DeveloperKitPath -ErrorAction Stop).Path
$type = & (Join-Path $DeveloperKitPath 'scripts/Detect-ProjectType.ps1') -ProjectPath $ProjectPath
$sources = @((Join-Path $DeveloperKitPath 'templates/common'), (Join-Path $DeveloperKitPath "templates/$type"))
$created = @()
$skipped = @()
$versionPath = Join-Path $DeveloperKitPath 'VERSION'
$version = if (Test-Path -LiteralPath $versionPath) { (Get-Content -LiteralPath $versionPath -Raw -Encoding UTF8).Trim() } else { 'unknown' }
$projectName = Split-Path -Leaf $ProjectPath
$generatedDate = Get-Date -Format 'yyyy-MM-dd'
foreach ($source in $sources) {
  if (-not (Test-Path -LiteralPath $source)) { continue }
  Get-ChildItem -LiteralPath $source -File -Recurse | ForEach-Object {
    $relative = $_.FullName.Substring($source.Length).TrimStart('\','/')
    $target = Join-Path $ProjectPath $relative
    if (Test-Path -LiteralPath $target) {
      $skipped += $target
    }
    elseif ($PSCmdlet.ShouldProcess($target, 'Create DeveloperKit template')) {
      $parent = Split-Path -Parent $target
      if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
      (Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8).Replace('{{PROJECT_TYPE}}', $type).Replace('{{PROJECT_PATH}}', $ProjectPath).Replace('{{PROJECT_NAME}}', $projectName).Replace('{{DEVELOPERKIT_VERSION}}', $version).Replace('{{GENERATED_DATE}}', $generatedDate) | Set-Content -LiteralPath $target -Encoding UTF8
      $created += $target
    }
  }
}
[pscustomobject]@{ DeveloperKitVersion = $version; ProjectType = $type; CreatedFiles = $created; SkippedExistingFiles = $skipped }
