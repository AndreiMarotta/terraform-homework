terraform {
  backend "s3" {
    bucket         = "backendfile-project1"
    key            = "virginia/terraform.tfstate"
    region         = "us-east-1"
    }
}