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