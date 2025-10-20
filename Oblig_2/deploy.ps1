Param(
    [string]$environment
)

# Find latest plan for the environment
$plan = Get-ChildItem "./plans" | Where-Object { $_.Name -like "$environment*" } | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $plan) {
    Write-Error "No plan found for environment $environment"
    exit 1
}

Write-Host "Applying plan $($plan.Name) for $environment"
terraform apply -auto-approve "$($plan.FullName)"

