# Create EFS 
resource "aws_efs_file_system" "Middleware-Production-EFS" {
  creation_token = "Middleware-Production-EFS"
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  kms_key_id = aws_kms_key.Middleware-Production-CMK.arn
  encrypted = true
  lifecycle_policy {
    transition_to_ia = "AFTER_90_DAYS"
  }
  tags = {
    Name = "Middleware-Production-EFS"
    Environment = "Production"
  }
 depends_on = [
   aws_security_group.Middleware-Production-EFS-sg
 ]

  lifecycle {
    prevent_destroy = false
  }
}

# Create Mount Target for EFS
resource "aws_efs_mount_target" "Middleware-Production-Mount-Target" {
  file_system_id = aws_efs_file_system.Middleware-Production-EFS.id
  subnet_id      = aws_subnet.Middleware-Production-PublicsubnetA.id
  security_groups = [aws_security_group.Middleware-Production-EFS-sg.id]

   lifecycle {
    prevent_destroy = false
  }
}