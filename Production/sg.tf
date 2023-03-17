# Create Security Group for Bastion Host
resource "aws_security_group" "Middleware-Production-Bastion-Host-sg" {
  name        = "Middleware-Production-Bastion-Host-sg"
  description = "Security Group for Bastion Host"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.78.10/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.78.15/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.79.10/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.79.15/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.79.35/32"]

  }

  ingress {
    description      = "GNR Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["14.140.153.130/32"]

  }

  ingress {
    description      = "GNR Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["122.15.248.20/32"]

  }

  ingress {
    description      = "HYD Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["123.63.49.135/32"]

  }

  ingress {
    description      = "HYD Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["14.140.145.251/32"]

  }

   egress {
    description = "Outbound traffic to Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Middleware-Production-Bastion-Host-sg"
  }

   lifecycle {
    prevent_destroy = false
  }
  }

# Create Security Group for Jenkins Server
resource "aws_security_group" "Middleware-Production-Jenkins-sg" {
  name        = "Middleware-Production-Jenkins-sg"
  description = "Security Group for Jenkins Server"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id

   egress {
    description = "Outbound traffic to Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    description = "Outbound traffic to Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Middleware-Production-Jenkins-sg"
  }

   lifecycle {
    prevent_destroy = false
  }
}

# Create Security Group for Sonarqube server
resource "aws_security_group" "Middleware-Production-Sonarqube-sg" {
  name        = "Middleware-Production-Sonarqube-sg"
  description = "Security Group for Sonarqube Server"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id

   egress {
    description = "Outbound traffic to Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Middleware-Production-Sonarqube-sg"
  }

   lifecycle {
    prevent_destroy = false
  }
}

# Create Security Group for Jenkins-agent Server
resource "aws_security_group" "Middleware-Production-Jenkins-agent-sg" {
  name        = "Middleware-Production-Jenkins-agent-sg"
  description = "Security Group for Jenkins agent"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id


  egress {
    description = "Outbound traffic to Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "Middleware-Production-Jenkins-agent-sg"
  }

   lifecycle {
    prevent_destroy = false
  }

}

# Create Secuity Group for Application Load Balancers
resource "aws_security_group" "Middleware-Production-LoadBalancer-sg" {
  name        = "Middleware-Production-LoadBalancer-sg"
  description = "Security Group for Load Balancers"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id

ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.78.10/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.78.15/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.79.10/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.79.15/32"]

  }

  ingress {
    description      = "Pune Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.81.79.35/32"]

  }

  ingress {
    description      = "GNR Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["14.140.153.130/32"]

  }

  ingress {
    description      = "GNR Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["122.15.248.20/32"]

  }

  ingress {
    description      = "HYD Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["123.63.49.135/32"]

  }

  ingress {
    description      = "HYD Public Ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["14.140.145.251/32"]

  }

  egress {
    description = "Outbound traffic to Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "Middleware-Production-LoadBalancer-sg"
  }

   lifecycle {
    prevent_destroy = false
  }
}

# Create Security Group for EFS

resource "aws_security_group" "Middleware-Production-EFS-sg" {
  name        = "Middleware-Production-EFS-sg"
  description = "Security Group for EFS"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id
  tags = {
    Name = "Middleware-Production-EFS-sg"
  }

   lifecycle {
    prevent_destroy = false
  }
}

# Create Security Group for EKS Cluster
resource "aws_security_group" "Middleware-Production-EKS-Securitygroup" {
  name        = "Middleware-Production-EKS-Securitygroup"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id

  egress {
    description = "Outbound traffic to Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Middleware-Production-EKS-Securitygroup"
  }

   lifecycle {
    prevent_destroy = false
  }
}

# Create Security group for Redis Cluster
resource "aws_security_group" "Middleware-Production-Redis-sg" {
  name = "Middleware-Production-Redis-sg"
  description = "SG to access Redis Cluster"
  vpc_id      = aws_vpc.Middleware-Production-VPC.id

  
  egress {
    description = "Outbound traffic to Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "Middleware-Production-Redis-sg"
  }
}


# Create Security Group for Postgres RDS
resource "aws_security_group" "Middleware-Production-PostgresRDS-sg" {
  name = "Middleware-Production-PostgresRDS-sg"
  description = "Secuity Group RDS postgres servers"
  vpc_id = aws_vpc.Middleware-Production-VPC.id

  tags = {
    Name = "Middleware-Production-PostgresRDS-sg"
  }

   lifecycle {
    prevent_destroy = false
  }

}

