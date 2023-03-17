# Create AMI for Jenkins Server
# Use this data source to get the ID of a registered AMI for use in other resources.
data "aws_ami" "Middleware-Production-Jenkins-Server-AMI" {
  most_recent = true

   filter {
     name   = "name"
     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
   }

  #  filter {
  #    name   = "image-id"
  #    values = ["ami-07cc4ac50dc41812"]
  #  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

# Create AMI for Agent Server
# Use this data source to get the ID of a registered AMI for use in other resources.
data "aws_ami" "Middleware-Production-Jenkins-Agent-AMI" {
  most_recent = true

   filter {
     name   = "name"
     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
   }

  #  filter {
  #    name   = "image-id"
  #    values = ["ami-0f7b7f0c3f97579c4"]
  #  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}


# Create AMI for Sonarqube Server
# Use this data source to get the ID of a registered AMI for use in other resources.
data "aws_ami" "Middleware-Prodcution-Sonarqube-Server-AMI" {
  most_recent = true

   filter {
     name   = "name"
     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
   }

  #  filter {
  #    name   = "image-id"
  #    values = ["ami-0664e5036b83e8877"]
  #  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

# Create AMI for Bastion Host
# Use this data source to get the ID of a registered AMI for use in other resources.
data "aws_ami" "Middleware-Production-Bastion-Host-AMI" {
  most_recent = true

   filter {
     name   = "name"
     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
   }

  #  filter {
  #    name   = "image-id"
  #    values = ["ami-08054eb04040f1e0d"]
  #  }

  

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}



# Create Bastion Host
resource "aws_instance" "Middleware-Production-Bastion-Host" {
  ami           = data.aws_ami.Middleware-Production-Bastion-Host-AMI.id
  instance_type = var.instance_type[0]
  key_name      = "jenkinsserver"
  subnet_id     = aws_subnet.Middleware-Production-PublicsubnetA.id
  vpc_security_group_ids = ["${aws_security_group.Middleware-Production-Bastion-Host-sg.id}"]
  monitoring = true
  
  

  tags = {
    Name = "Middleware-Production-Bastion-Host"
  }

   lifecycle {
    prevent_destroy = false
  }

}

 # Create Jenkins Server
resource "aws_instance" "Middleware-Production-Jenkins-server" {
   ami           = data.aws_ami.Middleware-Production-Jenkins-Server-AMI.id
   instance_type = var.instance_type[1]
   key_name      = "jenkinsserver"
   subnet_id     = aws_subnet.Middleware-Production-PrivatesubnetA.id
   vpc_security_group_ids = ["${aws_security_group.Middleware-Production-Jenkins-sg.id}"]
   monitoring = true
  
  
  
  tags = {
     Name = "Middleware-Production-Jenkins-server"
   }

    lifecycle {
    prevent_destroy = false
  }

}

# Create Sonarqube Server
resource "aws_instance" "Middleware-Production-Sonarqube-server" {
  ami           = data.aws_ami.Middleware-Prodcution-Sonarqube-Server-AMI.id
  instance_type = var.instance_type[1]
  key_name      = "sonarqubeserver"
  subnet_id     = aws_subnet.Middleware-Production-PrivatesubnetA.id
  vpc_security_group_ids = ["${aws_security_group.Middleware-Production-Sonarqube-sg.id}"]
  monitoring = true
  
  
  
  tags = {
    Name = "Middleware-Production-Sonarqube-server"
  }

   lifecycle {
    prevent_destroy = false
  }

}

# Create Jenkins agent Server
resource "aws_instance" "Middleware-Production-Jenkins-agent-server" {
  ami           = data.aws_ami.Middleware-Production-Jenkins-Agent-AMI.id
  instance_type = var.instance_type[1]
  key_name      = "jenkinsserver"
  subnet_id     = aws_subnet.Middleware-Production-PublicsubnetA.id
  vpc_security_group_ids = ["${aws_security_group.Middleware-Production-Jenkins-agent-sg.id}"]
  monitoring = true
  
  
  
  tags = {
    Name = "Middleware-Production-Jenkins-agent-server"
  }

   lifecycle {
    prevent_destroy = false
  }

}

# # Create Elastic IP for Bastion host
resource "aws_eip" "Middleware-Production-Bastion-eip" {
  
  vpc      = true
}

# # Create Elastic IP for jenkins-agent server
resource "aws_eip" "Middleware-Production-Jenkins-agentserver-eip" {
  
  vpc      = true
}

# # Create Elastic IP for Sonarqube server
# resource "aws_eip" "Middleware-Production-Sonarqubeserver-eip" {
  
#   vpc      = true
# }

# Create EIP association for associating EIP to Bastion server ##
resource "aws_eip_association" "Middleware-Production-Bastion-eipassociation" {
  instance_id   = aws_instance.Middleware-Production-Bastion-Host.id
  allocation_id = aws_eip.Middleware-Production-Bastion-eip.id

   lifecycle {
    prevent_destroy = false
  }
}

# # Create EIP association for associating EIP to Jenkins-agent server
resource "aws_eip_association" "Middleware-Production-Jenkins-agent-eipassociation" {
  instance_id   = aws_instance.Middleware-Production-Jenkins-agent-server.id
  allocation_id = aws_eip.Middleware-Production-Jenkins-agentserver-eip.id

  lifecycle {
    prevent_destroy = false
  }
}

# Create EIP association for associating EIP to Sonarqube server
# resource "aws_eip_association" "Middleware-Production-Sonarqube-eipassociation" {
#   instance_id   = aws_instance.Middleware-Production-Sonarqube-server.id
#   allocation_id = aws_eip.Middleware-Production-Sonarqubeserver-eip.id
# }


