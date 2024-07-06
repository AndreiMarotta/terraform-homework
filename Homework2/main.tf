  provider "aws" {
    region = "us-west-2"
    }


resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


# create bucket 
resource "aws_s3_bucket" "hw2-1" {
  bucket = "kaizen-andrei"
}

resource "aws_s3_bucket" "hw2-2" {
  bucket_prefix = "prefix-kaizen"
}

resource "aws_s3_bucket" "im_bucket3" {
  bucket = "kaizen-hw2-1"
}

resource "aws_s3_bucket" "im_bucket4" {
  bucket = "kaizen-hw2-2"
}
# import aws bucket
# terraform import aws_s3_bucket.im_bucket3 kaizen-hw2-1
# terraform import aws_s3_bucket.im_bucket4 kaizen-hw2-2

