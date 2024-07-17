provider aws {
    region = var.region
}

resource "aws_vpc" "kaizen" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

    tags = {
    Name = "kaizen"
  }
}

resource "aws_subnet" "Name" {
  count      = length(var.subnet)
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet[count.index].cidr
  az = "${var.region}${var.subnet[count.index].az}"
  map_public_ip_on_launch = var.ip_on_launch

  tags = {
    Name = var.subnet[count.index].name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.subnet[0].rt_name
  }
}

resource "aws_route_table" "prv_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.subnet[2].rt_name
  }
}

resource "aws_route_table_association" "rta" {
  count          = length(var.subnet)
  subnet_id      = aws_subnet.subnet[count.index].name.id
  route_table_id = aws_route_table.subnet[count.index].rt_name.id
}
