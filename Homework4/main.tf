provider aws {
    region = var.aws_region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.kp_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "Name" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count = var.instace_count
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = var.open_ports
  availability_zone = element(["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"], count.index)
  associate_public_ip_address = true

  tags = {
    Name = "web-${count.index + 1}"
  }
}

variable aws_region {
  description = "Provide region"
  type = string
  default = ""
}
variable ami_id {
  description = "Provide AMI id"
  type = string
  default = ""
}
variable instance_type {
  description = "Provide instance type"
  type = string
  default = ""
}
variable instace_count {
  description = "Provide number of instances"
  type = number 
  default = 1
}
variable kp_name {
  description = "Provide instance name"
  type = string 
  default = ""
}
# variable az_name {
#   description = "Provide availability zones"
#   type = string
#   #default = ""
# }

variable open_ports {
  description = "Provide ports to open"
  type        = list(number)
  default     = [22, 80, 443]
}
