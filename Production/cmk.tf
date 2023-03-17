resource "aws_kms_key" "Middleware-Production-CMK" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 30
  is_enabled = true
  enable_key_rotation = true

   lifecycle {
    prevent_destroy = false
  }  
}

resource "aws_kms_key" "Middleware-Production-EKS-CMK" {
  description             = "This key is used to encrypt Kubernetes Secrets"
  deletion_window_in_days = 30
  is_enabled = true
  enable_key_rotation = true

   lifecycle {
    prevent_destroy = false
  }
}

resource "aws_kms_key" "Middleware-Production-Flowlogbucket-CMK" {
  description             = "This key is used to encrypt Flowlogbucket"
  deletion_window_in_days = 30
  is_enabled = true
  enable_key_rotation = true

   lifecycle {
    prevent_destroy = false
  }
}
