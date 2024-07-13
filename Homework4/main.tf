provider aws {
    region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "Name" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count = 1
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

}

output ec2 {
    value = aws_instance.Name[0].public_ip   
}
