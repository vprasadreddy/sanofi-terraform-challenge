## Steps to run the code to provision DEV environment

- Clone the Repo
- Make necessary changes in dev.terraform.tfvars file and save it
- Navigate to root of the project and open a terminal/command prompt
- Run below command in sequence in terminal/command prompt
  - terraform init
  - terraform validate
  - terraform plan -var-file="dev.terraform.tfvars"
  - terraform apply -var-file="dev.terraform.tfvars" -auto-approve
  - terraform destroy -var-file="dev.terraform.tfvars" -auto-approve

## Steps to run the code to setup PROD environment

- Clone the Repo
- Copy dev.terraform.tfvars file and rename it as prod.terraform.tfvars. Update required variable values in prod.terraform.tfvars file and save it.
- Navigate to root of the project and open a terminal/command prompt
- Run below command in sequence in terminal/command prompt
  - terraform init
  - terraform validate
  - terraform plan -var-file="prod.terraform.tfvars"
  - terraform apply -var-file="prod.terraform.tfvars" -auto-approve
  - terraform destroy -var-file="prod.terraform.tfvars" -auto-approve

## Output Screenshot

![IMG_5271](https://github.com/user-attachments/assets/87c6bf3a-c214-46a7-b275-ab6e8f902d84)

![IMG_5265](https://github.com/user-attachments/assets/7f4199c1-e007-4891-8c76-821a6de10be1)

![IMG_5266](https://github.com/user-attachments/assets/08ff5fb5-060b-435d-a094-e471a70586c1)

![IMG_5267](https://github.com/user-attachments/assets/7fdb8870-eee1-4ea4-b779-7822acf72f69)

![IMG_5268](https://github.com/user-attachments/assets/31530569-6396-4925-b752-2ca62525f91a)

![IMG_5269](https://github.com/user-attachments/assets/f8829197-f85d-4fa4-8c60-b9023beac708)

![IMG_5270](https://github.com/user-attachments/assets/61d30cef-5a53-4ba1-a7dd-166a381100cb)


