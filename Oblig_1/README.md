# Obligatory assignment 1 (in organization)
### - Magnus Lange


### How to deploy 
To deploy the infrastructure, you first need to authenticate into the azure cli, then you can run terraform init in the wanted enviroment (prod or dev).

cd ./Oblig_1/prod
az login
##### Complete the online login in the browser

##### Open locals.tf and change subscription_id to your environment
open ./Oblig_1/prod/locals.tf

terraform init
terraform plan -out=tfplan
terraform apply tfplan

##### When done testing
terraform destroy -auto-approve

### Structure 
This zip-folder contains all the files needed to deploy a simple, two-layer infrastructure in Azure. It is organized in two enviroments (dev and prod), which are almost identical, except for different naming standards. 

The code deploys a vnet with a rg and nsg, and deploys a VM within a subnet. 

### Architecture
For this assignment, I have chosen a more modular approach where (almost) every azure resource has their own stack. This means we have a stack for pip, vm, nsg and network. This microstack approach is great because it means I can reuse this code later, but it also creates some dependencies that were not necessary. An example of this is that I can no longer easily deploy a vm by running just one module. 

### Configurations 
If you want to customize the deployment, this should only be done in the root folder (not in the modules). The most effective way to do this is by changing the terraform.tfvars file or the local values. 

### Local values
In this repository I use local values to ensure naming standards and key values such as subscription-id and tags. This makes the code modular and allows us to use it in different usage cases without changing too much. (When running it in a different enviroment one can simply change the tags and the subscription-id in the ./prod/locals.tf file.)

### What does this project do?
This deploys a scalable solution of a VM with an associated public IP. 