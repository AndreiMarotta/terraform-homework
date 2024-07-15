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
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone = element(["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"], count.index)
    
  tags = {
    Name = "web-${count.index + 1}"
}
  }