# Created Bucket middleware-production-object-storage
resource "aws_s3_bucket" "middleware-production-object-storage" {
    bucket = "middleware-production-object-storage"
    
    acl = "private"
     

  lifecycle_rule {
    id = "archive"
    enabled = true
    transition {
      days = 365
      storage_class = "GLACIER"
    }

  }

  versioning {
    enabled = true
  }

  tags = {
    Enviroment: "Production"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.Middleware-Production-CMK.arn
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_metric" "enable-metrics-bucket" {
  bucket = aws_s3_bucket.middleware-production-object-storage.id
  name   = "EntireBucket"
}

# create event notification Policy for middleware-production-object-storage
resource "aws_sqs_queue" "Middleware-Production-Standard-Ingestion" {
  name = "Middleware-Production-Standard-Ingestion"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:Middleware-Production-Standard-Ingestion",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.middleware-production-object-storage.arn}" }
      }
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.middleware-production-object-storage.id

  queue {
    queue_arn     = aws_sqs_queue.Middleware-Production-Standard-Ingestion.arn
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "avails/"
  }

   queue {
    queue_arn     = aws_sqs_queue.Middleware-Production-Standard-Ingestion.arn
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "inventory/"
  }
}
 
 #Create Folder inside Bucket with name avails
resource "aws_s3_bucket_object" "base_folder" {
    bucket = aws_s3_bucket.middleware-production-object-storage.id
    key = "avails/"
    
}

#Create Folder inside Bucket with name inventory
resource "aws_s3_bucket_object" "folder" {
    bucket = aws_s3_bucket.middleware-production-object-storage.id
    key = "inventory/"
    
}

#Bucket and Object are not Publically accessible
resource "aws_s3_bucket_public_access_block" "middleware-production-object-storage" {
  bucket = aws_s3_bucket.middleware-production-object-storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

###################################################################
# Created Bucket middleware-production-all-elb-log-storage

resource "aws_s3_bucket" "middleware-production-all-elb-log-storage" {
    bucket = "middleware-production-all-elb-log-storage"

  acl = "private"

  lifecycle_rule {
    id = "archive"
    enabled = true
    transition {
      days = 365
      storage_class = "GLACIER"
    }

  }

  versioning {
    enabled = true
  }

  tags = {
    Enviroment: "Production"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.Middleware-Production-CMK.arn
        sse_algorithm = "aws:kms"
      }
    }
  }
}

#Bucket and Object inside Bucket are not Publically
resource "aws_s3_bucket_public_access_block" "middleware-production-all-elb-log-storage" {
  bucket = aws_s3_bucket.middleware-production-all-elb-log-storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_metric" "enable-metrics-bucket-middleware-production-all-elb-log-storage" {
  bucket = aws_s3_bucket.middleware-production-all-elb-log-storage.id
  name   = "EntireBucket"
}

#######################################################################
# Created Bucket middleware-production-infrastructure-bucket

resource "aws_s3_bucket" "middleware-production-infrastructure-bucket" {
    bucket = "middleware-production-infrastructure-bucket"

  acl = "private"

  lifecycle_rule {
    id = "archive"
    enabled = true
    transition {
      days = 365
      storage_class = "GLACIER"
    }

  }

  versioning {
    enabled = true
  }

  tags = {
    Enviroment: "Production"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.Middleware-Production-CMK.arn
        sse_algorithm = "aws:kms"
      }
    }
  }
}

#Bucket and Object are not publically accessible
resource "aws_s3_bucket_public_access_block" "middleware-production-infrastructure-bucket" {
  bucket = aws_s3_bucket.middleware-production-infrastructure-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_metric" "enable-metrics-bucket-middleware-production-infrastructure-bucket" {
  bucket = aws_s3_bucket.middleware-production-infrastructure-bucket.id
  name   = "EntireBucket"
}

######################################################################
# # created s3 bucket to store terraform state file for Production
  # terraform {
  #   backend "s3" {
  #     bucket = "middleware-production-infrastructure-bucket"
  #     key    = "production_state_backup/terraform.tfstate"
  #     region = "us-east-1"
  #   }
  # }
