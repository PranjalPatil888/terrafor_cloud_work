# Create EBS Volume for Jenkins server
resource "aws_ebs_volume" "Middleware-Production-Jenkinsebs" {
  availability_zone = var.availability_zone_names[0]
  size              = 32

  tags = {
    Name = "Middleware-Production-Jenkinsebs"
  }

   lifecycle {
    prevent_destroy = false
  }
}

# Create EBS Volume for Jenkins agent
resource "aws_ebs_volume" "Middleware-Production-Jenkinsagentebs" {
  availability_zone = var.availability_zone_names[0]
  size              = 32

  tags = {
    Name = "Middleware-Production-Jenkinsagentebs"
  }

   lifecycle {
    prevent_destroy = false
  }
}

# Create Volume attachment resource for Jenkins server
resource "aws_volume_attachment" "Middleware-Production-ebs-volume-masterattachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.Middleware-Production-Jenkinsebs.id
  instance_id = aws_instance.Middleware-Production-Jenkins-server.id

   lifecycle {
    prevent_destroy = false
  }
}

# Create Volume attachment resource for Jenkins agent server
resource "aws_volume_attachment" "Middleware-Production-ebs-volume-agentattachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.Middleware-Production-Jenkinsagentebs.id
  instance_id = aws_instance.Middleware-Production-Jenkins-agent-server.id

   lifecycle {
    prevent_destroy = false
  }
}

