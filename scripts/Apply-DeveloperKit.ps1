[CmdletBinding(SupportsShouldProcess)]
param([Parameter(Mandatory = $true)][string]$ProjectPath, [Parameter(Mandatory = $true)][string]$DeveloperKitPath)
$type = & (Join-Path $DeveloperKitPath 'scripts/Detect-ProjectType.ps1') -ProjectPath $ProjectPath
$sources = @((Join-Path $DeveloperKitPath 'templates/common'), (Join-Path $DeveloperKitPath "templates/$type"))
$created = @()
foreach ($source in $sources) {
  if (-not (Test-Path -LiteralPath $source)) { continue }
  Get-ChildItem -LiteralPath $source -File -Recurse | ForEach-Object {
    $relative = $_.FullName.Substring($source.Length).TrimStart('\','/')
    $target = Join-Path $ProjectPath $relative
    if (-not (Test-Path -LiteralPath $target) -and $PSCmdlet.ShouldProcess($target, 'DeveloperKit 템플릿 생성')) {
      $parent = Split-Path -Parent $target
      if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
      (Get-Content -LiteralPath $_.FullName -Raw).Replace('{{PROJECT_TYPE}}', $type).Replace('{{PROJECT_PATH}}', $ProjectPath) | Set-Content -LiteralPath $target -Encoding UTF8
      $created += $target
    }
  }
}
[pscustomobject]@{ ProjectType = $type; CreatedFiles = $created }
