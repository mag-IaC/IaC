# Obligatory assignment 1
### - Magnus Lange


### Structure 
This zip-folder contains all the files needed to deploy a simple, two-layer infrastructure in Azure. It is organized in two enviroments (dev and prod), which are almost identical, except for different naming standards, as well as prod using more powerful resources. 

The code deploys a vnet with a rg and nsg, and deploys a VM within a subnet. 

### Architecture
For this assignment, I have chosen a more modular approach where (almost) every azure resource has their own stack. This means we have a stack for pip, vm, nsg and network. This microstack approach is great because it means I can reuse this code later, but it also creates some dependencies that were not necessary. An example of this is that I can no longer easily deploy a vm by running just one module. 


### How to deploy 
To deploy the infrastructure, you first need to authenticate into the azure cli, then you can run terraform init in the wanted enviroment (prod or dev).

terraform plan -out=FILE
terraform apply FILE 

### Configurations 
If you want to customize the deployment, this should only be done in the root folder (not in the modules). The most effective way to do this is by changing the terraform.tfvars file. 