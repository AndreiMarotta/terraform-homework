provider aws {
    region = "us-west-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}


data "aws_ami" "amazon_linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "Name" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  count = 3
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = element(["us-west-2a", "us-west-2b", "us-west-2c"], count.index)
  associate_public_ip_address = true
  user_data = file("apache.sh")
  user_data_replace_on_change = true

    tags = {
    Name = "web-${count.index + 1}"
  }
}

output ec2 {
    value = aws_instance.Name[0].public_ip   
}
