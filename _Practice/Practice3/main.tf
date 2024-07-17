provider aws {
    region = "us-west-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web-1" {
  ami           = "ami-03b039a920e4e8966"
  instance_type = "t2.micro"
  availability_zone = "us-west-2a"
  subnet_id = "subnet-0db446b326d98e885"
  count = 1
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  user_data_replace_on_change = true
}

output ec2-2a {
    value = aws_instance.web-1[0].public_ip   
}

resource "aws_instance" "web-2" {
  ami           = "ami-03b039a920e4e8966"
  instance_type = "t2.micro"
  availability_zone = "us-west-2c"
  subnet_id = "subnet-072a5523ae1ea4211"
  count = 1
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  user_data_replace_on_change = true
}

output ec2-2c {
    value = aws_instance.web-2[0].public_ip   
}

resource "aws_instance" "web-3" {
  ami           = "ami-03b039a920e4e8966"
  instance_type = "t2.micro"
  availability_zone = "us-west-2b"
  subnet_id = "subnet-0d80747369131bb15"
  count = 1
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  user_data_replace_on_change = true
}

output ec2-2b {
    value = aws_instance.web-3[0].public_ip   
}