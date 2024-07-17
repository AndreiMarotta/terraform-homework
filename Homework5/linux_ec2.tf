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

resource "aws_instance" "web-amazon" {
  ami           = data.aws_ami.linux.id
  instance_type = var.ec2_type[1].instance_type
  subnet_id = aws_subnet.pb1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache-amazon.sh")

  tags = {
    Name = var.ec2_ins[0].name
  }
}

output ec2-amazon {
    value = aws_instance.web-amazon.public_ip
}