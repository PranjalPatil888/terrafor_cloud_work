# Create ECR for Production
resource "aws_ecr_repository" "middleware-production-ecr-repository" {
  name                 = "middleware-production-ecr-repository"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
   encryption_type = "KMS"
  }
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Create ECR for Production notification
resource "aws_ecr_repository" "middleware-notification-production-ecr-repository" {
  name                 = "middleware-notification-production-ecr-repository"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
   encryption_type = "KMS"
  }
  image_scanning_configuration {
    scan_on_push = true
  }
}


