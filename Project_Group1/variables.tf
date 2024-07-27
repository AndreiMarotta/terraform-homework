variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucketname" {
  type        = string
  default ="backendfile-project1"
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
  default = "snoozerandfriends.com"
}

variable "index_doc" {
  description = "Filename of the index document"
  type        = string
  default     = "index.html"
}

variable "error_doc" {
  description = "Filename of the error document"
  type        = string
  default     = "error.html"
}

variable "qr_doc" {
  description = "Filename of the error document"
  type        = string
  default     = "GoodByeQR.html"
}

variable "qr_png" {
  description = "Filename of the error document"
  type        = string
  default     = "/home/ec2-user/terraform-homework/Project_Group1/GoodByeQR.png"
}