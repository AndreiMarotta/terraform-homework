provider aws {
    region = "us-west-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "Name" {
  ami           = "ami-03b039a920e4e8966"
  instance_type = "t2.micro"
  count = 3
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  user_data_replace_on_change = true

  tags = local.common_tags
}

output ec2 {
    value = aws_instance.Name[0].public_ip   
}
