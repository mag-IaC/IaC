# Description of workflow!

I will now explain the workflow that each team member given a specific task should go through to implement it (trunk-based). 

# hey

# 3:17




# Deploying a resource in different enviroments 

### dev
$timestamp = Get-Date -Format "yyyyddMM-HHmmss"
terraform init -reconfigure -backend-config="key=projects/oblig2/dev.tfstate"
terraform plan -var-file="enviroments/dev.tfvars" -out="plans/dev_$timestamp.plan"

terraform apply .\plans\FILE.plan


### prod
$timestamp = Get-Date -Format "yyyyddMM-HHmmss"
terraform init -reconfigure -backend-config="key=projects/oblig2/prod.tfstate"
terraform plan -var-file="enviroments/prod.tfvars" -out="plans/prod_$timestamp.plan"

terraform apply .\plans\FILE.plan

# test
$timestamp = Get-Date -Format "yyyyddMM-HHmmss"
terraform init -reconfigure -backend-config="key=projects/oblig2/test.tfstate"
terraform plan -var-file="enviroments/test.tfvars" -out="plans/test_$timestamp.plan"

terraform apply .\plans\FILE.plan
