provider "aws" {
  region = var.aws_region
}

module "s3_website" {
  source = "./modules/s3_website"

  domain_name    = var.domain_name
  subdomain_name = var.subdomain_name
  bucket_name    = var.s3_bucket_name
  index_document = var.index_document
  error_document = var.error_document
}
