terraform {
  backend "s3" {
    bucket = "andrei-kaizen"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
  }
}
