[CmdletBinding()]
param([Parameter(Mandatory = $true)][string]$ProjectPath)
$files = @(Get-ChildItem -LiteralPath $ProjectPath -Filter '*.csproj' -File -ErrorAction SilentlyContinue)
if ($files.Count -eq 0) { 'unknown'; exit 0 }
$content = ($files | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw }) -join "`n"
if ($content -match 'Microsoft.NET.Sdk.Web|Microsoft.NET.Sdk.Razor') { 'aspnet' }
elseif ($content -match 'UseWPF|PresentationFramework') { 'wpf' }
elseif ($content -match 'UseWindowsForms|System.Windows.Forms') { 'winforms' }
elseif ($content -match 'OutputType.*Exe') { 'console' }
else { 'classlibrary' }
