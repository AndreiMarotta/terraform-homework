What are and how to use the tfvars:
https://spacelift.io/blog/terraform-tfvars

Clone the working repository in your machine:
git clone <repository_url>

Initialize Terraform:
terraform init

Create folders that will be pushed the repository such as:
main.tf
sg.tf
variables.tf

Create a file_name.tfvars file with your configurations. Provide all the required variables specific for that tfvar file:
viginia.tfvars
oregon.tfvars

Deploy in a specific region:
terraform apply -var-file oregon.tfvars
terraform apply -var-file virginia.tfvars

Destroy the regional resources:
terraform destroy -var-file oregon.tfvars
terraform destroy -var-file virginia.tfvars

Or you can destroy them all:
terrafom destroy
