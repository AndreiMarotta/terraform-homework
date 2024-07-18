data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

data "aws_ami" "linux" {
  most_recent = true
  
  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
}
owners = ["137112412989"] # Canonical
}

resource "aws_instance" "Ubuntu" {
  count      = length(var.subnet)
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_type[0].instance_type
  subnet_id = aws_subnet.main[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("ubuntu_apache.sh")

    tags = {
    Name = var.ec2_type[0].name
  }
}

# output ec2-ubuntu {
#     value = aws_instance.Ubuntu.public_ip
# }

resource "aws_instance" "Amazon" {
  count      = length(var.subnet)
  ami           = data.aws_ami.linux.id
  instance_type = var.ec2_type[1].instance_type
  subnet_id = aws_subnet.main[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("amazon_apache.sh")

  tags = {
    Name = var.ec2_type[1].name
  }
}

# output ec2-amazon {
#     value = aws_instance.Amazon.public_ip
# }