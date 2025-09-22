# Obligatory assignment 1
### - Magnus Lange


### Structure 
This zip-folder contains all the files needed to deploy a simple, two-layer infrastructure in Azure. It is organized in two enviroments (dev and prod), which are almost identical, except for different naming standards, as well as prod using more powerful resources. 

The code deploys a vnet with a rg and nsg, and deploys a VM within a subnet. 


### How to deploy 
To deploy the infrastructure, you first need to authenticate into the azure cli, then you can run terraform init in the wanted enviroment 