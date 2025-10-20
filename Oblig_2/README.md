# Description of workflow!

I will now explain the workflow that this obligatory assignment has shown. From configuring and writing the local code, til deploying it with CI/CD. 

# Starting configuration

We have the following folder structure (created by GPT, modified to fit our infrastructure): 

DCST3005/                 <-- root repository folder
│
├─ .github/
│   └─ workflows/
│       ├─ achieving_ci.yaml    <-- CI workflow
│       └─ achieving_cd.yaml   <-- CD workflow
│
├─ Oblig_2/            <-- Terraform project folder
│   ├─ main.tf
│   ├─ variables.tf
│   ├─ locals.tf
│   ├─ output.tf
│   ├─ deploy.ps1       <-- PowerShell deployment script (used in CD)
│   ├─ plans/           <-- folder containing committed plan files
│   └─ enviroments/     <-- folder containing dev.tfvars, test.tfvars, prod.tfvars
    ├─ modules/            <-- Terraform modules, e.g., storage_account
│       └─ sa/
│           ├─ main.tf
│           ├─ variables.tf
│           └─ output.tf
└─ .gitignore

In a commercial setting with dedicated teams, this would be deployed by forking a repository. 

When we are in the root repository, we should fork it to create a feature-branch

`git pull origin main `
`git checkout -b feature/your-feature-name`


Now that we have the files are on a feature branch, we need to initialize terraform, depending on what enviroment you are working on (here for test)

`terraform init -reconfigure -backend-config="key=projects/oblig2/test.tfstate"`

When you are ready to plan and test the configuration run: 

`terraform init -reconfigure -backend-config="key=projects/oblig2/dev.tfstate" `
`terraform plan -var-file="enviroments/dev.tfvars" -out="plans/dev_$timestamp.plan"`
`terraform apply .\plans\FILE.plan `

When you are happy with the changes you have made, you need to commit them 

`git add . `
`git commit -m "Add feature XYZ"`

And publish them on github (where you can create a Pull Request)

`git push -u origin feature/your-feature-name `

We have implemented two workflows which will trigger if you create a PR (or commit directly) to the main branch. The code is only commited/merged if it passes both tests. 

When new code is commited to the main branch, the second workflow (CD) is triggered. This automatically applies the changes made to dev and test, while waiting for approval from one of the registered users. 


# Rollback 

If you want to roll back some of the infrastructure you can use the ./plans folder to see the timestamped terraform plans, and apply them. 

##### The end!

# 3:29



