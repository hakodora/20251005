# Usage:
# 1. Download the artifact (phase1-flutter-web.zip) from GitHub Actions artifacts or Releases to local machine.
# 2. Unzip it to a folder, e.g., C:\\tmp\\phase1-web\\
# 3. Run this script: .\\deploy_artifact_to_cloudstudio.ps1 -LocalPath 'C:\\tmp\\phase1-web\\web'
# This script will call the local deploy_sandbox wrapper (if available) or instruct the operator to run the deploy_sandbox tool.

param(
  [Parameter(Mandatory=$true)]
  [string]$LocalPath
)

if (-not (Test-Path $LocalPath)) {
  Write-Error \"LocalPath '$LocalPath' not found. Please ensure the Flutter web build files exist.\"
  exit 1
}

# Package into a zip for upload
$zipPath = Join-Path -Path (Get-Location) -ChildPath \"Phase1_Flutter_Web_$(Get-Date -Format yyyyMMddHHmmss).zip\"
if (Test-Path $zipPath) { Remove-Item $zipPath }
Compress-Archive -Path (Join-Path $LocalPath '*') -DestinationPath $zipPath

Write-Output \"Zipped web build to: $zipPath\"

Write-Output \"Next steps:\"
Write-Output \"1) Upload the zip to CloudStudio via its web console or API and configure a static site pointing to the unzipped content.\"
Write-Output \"2) Alternatively, provide the zip to the assistant so it can call deploy_sandbox to deploy the path.\"
Write-Output \"3) If you have a deployment webhook (CI), set DEPLOY_WEBHOOK_URL in GitHub Secrets and enable the webhook call in the workflow.\"

# If you want to automatically deploy via this script using the assistant's deploy_sandbox,
# please upload the zip to the project workspace and then ask the assistant to run deploy_sandbox on the path.\"