[CmdletBinding()]
param(
  [Parameter(Mandatory = $true)][string]$ProjectPath,
  [Parameter(Mandatory = $true)][string]$DeveloperKitPath
)

$ProjectPath = (Resolve-Path -LiteralPath $ProjectPath -ErrorAction Stop).Path
$DeveloperKitPath = (Resolve-Path -LiteralPath $DeveloperKitPath -ErrorAction Stop).Path
$type = & (Join-Path $DeveloperKitPath 'scripts/Detect-ProjectType.ps1') -ProjectPath $ProjectPath
$deploymentFile = ([string][char]0xBC30) + ([char]0xD3EC) + ([char]0xBC29) + ([char]0xBC95) + '.md'
$logRetentionMarker = ([string][char]0xCD5C) + ([char]0xB300) + ' 6' + ([char]0xAC1C) + ([char]0xC6D4)
$requiredFiles = @(
  'AGENTS.md',
  'WORKLOG.md',
  'CODEX_HANDOFF.md',
  'DEV_STATE.md',
  'README_DEVELOPER.md',
  $deploymentFile,
  'WORK_CHECKLIST.md',
  'CODEX_PROMPT.md',
  '.vscode/settings.json',
  '.vscode/extensions.json',
  'docs/Architecture.md',
  'docs/ChangeHistory.md',
  'docs/Troubleshooting.md',
  'docs/Customer_Customizing.md',
  'docs/OperationalStandards.md',
  'README_PROJECT_TYPE.md'
)

$fileChecks = foreach ($relativePath in $requiredFiles) {
  $fullPath = Join-Path $ProjectPath $relativePath
  [pscustomobject]@{
    Path = $relativePath
    Exists = Test-Path -LiteralPath $fullPath -PathType Leaf
  }
}

$policyChecks = @(
  [pscustomobject]@{
    Policy = 'Log retention policy'
    Passed = (Test-Path -LiteralPath (Join-Path $ProjectPath 'docs/OperationalStandards.md')) -and
      ((Get-Content -LiteralPath (Join-Path $ProjectPath 'docs/OperationalStandards.md') -Raw -Encoding UTF8) -match [regex]::Escape($logRetentionMarker))
  },
  [pscustomobject]@{
    Policy = 'Build and publish version policy'
    Passed = (Test-Path -LiteralPath (Join-Path $ProjectPath $deploymentFile)) -and
      ((Get-Content -LiteralPath (Join-Path $ProjectPath $deploymentFile) -Raw -Encoding UTF8) -match 'Git.*vMAJOR\.MINOR\.PATCH')
  }
)

$missingFiles = @($fileChecks | Where-Object { -not $_.Exists } | ForEach-Object Path)
$failedPolicies = @($policyChecks | Where-Object { -not $_.Passed } | ForEach-Object Policy)

[pscustomobject]@{
  ProjectType = $type
  Passed = ($missingFiles.Count -eq 0 -and $failedPolicies.Count -eq 0)
  MissingFiles = $missingFiles
  FailedPolicies = $failedPolicies
  FileChecks = $fileChecks
  PolicyChecks = $policyChecks
}
