provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my-project-bucket" {
  bucket = var.bucketname
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my-project-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my-project-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.my-project-bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  depends_on = [aws_s3_bucket_acl.example]
  bucket = aws_s3_bucket.my-project-bucket.id
  key    = var.index_doc
  source = var.index_doc
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  depends_on = [aws_s3_bucket_acl.example]
  bucket = aws_s3_bucket.my-project-bucket.id
  key    = var.error_doc
  source = var.error_doc
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.my-project-bucket.id
  index_document {
    suffix = var.index_doc
  }
  error_document {
    key = var.error_doc
    }
      depends_on = [ aws_s3_bucket_acl.example ]
}

resource "aws_route53_zone" "primary" {
  name = "snoozerandfriends.com"
}

resource "aws_route53_record" "www" {
  zone_id = "Z05998023AFX350ZLIJ38"
  name = "ccc.snoozerandfriends.com"
  type = "CNAME"
  ttl = 300
  records = ["${aws_s3_bucket.my-project-bucket.bucket}.s3-website-us-east-1.amazonaws.com"]
}


