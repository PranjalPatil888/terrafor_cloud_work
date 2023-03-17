#creat vpc
resource "aws_vpc" "Middleware-Production-VPC" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name        = "Middleware-Production-VPC"
    Environment = "production"

  }
}

# creating IGW
resource "aws_internet_gateway" "Middleware-Production-IGW" {
  vpc_id = aws_vpc.Middleware-Production-VPC.id

  tags = {
    Name        = "Middleware-Production-IGW"
    Environment = "production"
  }
}

#creating public subnet 1
resource "aws_subnet" "Middleware-Production-PublicsubnetA" {
  vpc_id                  = aws_vpc.Middleware-Production-VPC.id
  cidr_block              = var.public_subnet_cidr_1
  availability_zone       = var.availability_zone_names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Middleware-Production-PublicsubnetA"
    Environment = "production"
  }
}

#creating public subnet 2
resource "aws_subnet" "Middleware-Production-PublicsubnetB" {
  vpc_id                  = aws_vpc.Middleware-Production-VPC.id
  cidr_block              = var.public_subnet_cidr_2
  availability_zone       = var.availability_zone_names[1]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Middleware-Production-PublicsubnetB"
    Environment = "Production"
  }
}

#creating Route table and public subnets
resource "aws_route_table" "Middleware-Production-Publicroutetable" {
  vpc_id = aws_vpc.Middleware-Production-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Middleware-Production-IGW.id
  }


  tags = {
    Name        = "Middleware-Production-Publicroutetable"
    Environment = "Production"
  }
}

#creating private subnet 1
resource "aws_subnet" "Middleware-Production-PrivatesubnetA" {
  vpc_id                  = aws_vpc.Middleware-Production-VPC.id
  cidr_block              = var.private_subnet_cidr_1
  availability_zone       = var.availability_zone_names[0]
  map_public_ip_on_launch = false

  tags = {
    Name        = "Middleware-Production-PrivatesubnetA"
    Environment = "Production"
  }
}

#creating private subnet 2
resource "aws_subnet" "Middleware-Production-PrivatesubnetB" {
  vpc_id                  = aws_vpc.Middleware-Production-VPC.id
  cidr_block              = var.private_subnet_cidr_2
  availability_zone       = var.availability_zone_names[1]
  map_public_ip_on_launch = false

  tags = {
    Name        = "Middleware-Production-PrivatesubnetB"
    Environment = "Production"
  }
}

#creating Route table for private subnets
resource "aws_route_table" "Middleware-Production-Privateroutetable" {
  vpc_id = aws_vpc.Middleware-Production-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Middleware-Production-NAT-gateway.id
  }

  tags = {
    Name        = "Middleware-Production-Privateroutetable"
    Environment = "Production"
  }
}

# creating public subnet 1 association
resource "aws_route_table_association" "Middleware-Production-PublicroutetableassociationA" {
  subnet_id      = aws_subnet.Middleware-Production-PublicsubnetA.id
  route_table_id = aws_route_table.Middleware-Production-Publicroutetable.id
}

# creating public subnet 2 association
resource "aws_route_table_association" "Middleware-Production-PublicroutetableassociationB" {
  subnet_id      = aws_subnet.Middleware-Production-PublicsubnetB.id
  route_table_id = aws_route_table.Middleware-Production-Publicroutetable.id
}

# creating private subnet 1 association
resource "aws_route_table_association" "Middleware-Production-PrivateroutetableassociationA" {
  subnet_id      = aws_subnet.Middleware-Production-PrivatesubnetA.id
  route_table_id = aws_route_table.Middleware-Production-Privateroutetable.id
}


# creating private subnet 2 association
resource "aws_route_table_association" "Middleware-Production-PrivateroutetableassociationB" {
  subnet_id      = aws_subnet.Middleware-Production-PrivatesubnetB.id
  route_table_id = aws_route_table.Middleware-Production-Privateroutetable.id
}

# creating eip
resource "aws_eip" "Middleware-Production-EIP" {
  vpc        = true
  depends_on = [aws_internet_gateway.Middleware-Production-IGW]

  tags = {
    Name = "Middleware-Production-EIP"
  }
}


#creating nat gateway
resource "aws_nat_gateway" "Middleware-Production-NAT-gateway" {
  allocation_id = aws_eip.Middleware-Production-EIP.id
  subnet_id     = aws_subnet.Middleware-Production-PublicsubnetA.id

  tags = {
    Name = "Middleware-Production-NAT-gateway"
  }

  depends_on = [aws_internet_gateway.Middleware-Production-IGW]
}



#creating security groups

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
