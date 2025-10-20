Param(
    [string]$environment
)

# Determine correct tfvars and state key
$tfvars = "enviroments/$environment.tfvars"
$stateKey = "projects/oblig2/$environment.tfstate"

Write-Host "Initializing Terraform for $environment..."
terraform init -reconfigure -backend-config="key=$stateKey"

Write-Host "Planning and applying for $environment..."

terraform plan -var-file="$tfvars" -out="plan$environment.tfplan"
terraform apply -auto-approve "plan$environment.tfplan"
