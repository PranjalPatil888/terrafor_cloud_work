#-------------------------------------------------#
# Create SQS queue for Production Environment
#-------------------------------------------------#
# Note =Create S3 bucket = middleware-Production-object-storage
# Middleware-Production-Standard-Ingestion SQS

# resource "aws_sqs_queue" "Middleware-Production-Standard-Ingestion" {
#   name                      = "Middleware-Production-Standard-Ingestion"
#   delay_seconds             = 10
#   max_message_size          = 262144
#   message_retention_seconds = 345600
#   receive_wait_time_seconds = 20
#   sqs_managed_sse_enabled = true
#   redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.Middleware-Production-Deadletter-Ingestion.arn}\",\"maxReceiveCount\":10}"
#   tags = {
#     Name = "Middleware-Production-Standard-Ingestion"
#     Environment = "Prod"
#   }
# }



#  SQS Policy Middleware-Production-Standard-Ingestion SQS

resource "aws_sqs_queue_policy" "prodpolicy-Standard-Ingestion" {
  queue_url = aws_sqs_queue.Middleware-Production-Standard-Ingestion.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "prod-Standard-Ingestion-ID",
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "SQS:SendMessage",
      "Resource": "arn:aws:sqs:us-east-1:197937841339:Middleware-Production-Standard-Ingestion",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "197937841339"
        },
        "ArnLike": {
          "aws:SourceArn": "arn:aws:s3:*:*:middleware-Production-object-storage"
        }
      }
    }
  ]
}
POLICY
}


# Middleware-Production-Deadletter-Ingestion SQS

resource "aws_sqs_queue" "Middleware-Production-Deadletter-Ingestion" {
  name = "Middleware-Production-Deadletter-Ingestion"
  sqs_managed_sse_enabled = true
}

###########################################################

# Middleware-Production-Standard-Adresponse SQS


resource "aws_sqs_queue" "Middleware-Production-Standard-Adresponse" {
  name                      = "Middleware-Production-Standard-Adresponse"
  delay_seconds             = 10
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 20
  sqs_managed_sse_enabled = true
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.Middleware-Production-Deadletter-Adresponse.arn}\",\"maxReceiveCount\":10}"
  tags = {
    Name = "Middleware-Production-Standard-Adresponse"
    Environment = "Prod"
  }
}

#  SQS Policy Middleware-Production-Standard-Adresponse SQS

resource "aws_sqs_queue_policy" "prodpolicy-Standard-Adresponse" {
  queue_url = aws_sqs_queue.Middleware-Production-Standard-Adresponse.id

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "prod_Standard-Adresponse_policy_ID",
  "Statement": [
    {
      "Sid": "prodpolicy-Standard-Adresponse-ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::197937841339:root"
      },
      "Action": "SQS:*",
      "Resource": "arn:aws:sqs:us-east-1:197937841339:Middleware-Production-Standard-Adresponse"
    }
  ]
}
POLICY
}

# Middleware-Production-Deadletter-Adresponse SQS


resource "aws_sqs_queue" "Middleware-Production-Deadletter-Adresponse" {
  name = "Middleware-Production-Deadletter-Adresponse"
  sqs_managed_sse_enabled = true
}

##############################################################

# Middleware-Production-Standard-Plays SQS


resource "aws_sqs_queue" "Middleware-Production-Standard-Plays" {
  name                      = "Middleware-Production-Standard-Plays"
  delay_seconds             = 10
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 20
  sqs_managed_sse_enabled = true
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.Middleware-Production-Deadletter-Plays.arn}\",\"maxReceiveCount\":10}"
  tags = {
    Name = "Middleware-Production-Standard-Plays"
    Environment = "Prod"
  }
}

#  SQS Policy Middleware-Production-Standard-Plays SQS

resource "aws_sqs_queue_policy" "prodpolicy-Standard-Plays" {
  queue_url = aws_sqs_queue.Middleware-Production-Standard-Plays.id

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "prod_Standard-Plays_policy_ID",
  "Statement": [
    {
      "Sid": "prodpolicy-Standard-Plays-ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::197937841339:root"
      },
      "Action": "SQS:*",
      "Resource": "arn:aws:sqs:us-east-1:197937841339:Middleware-Production-Standard-Plays"
    }
  ]
}
POLICY
}

# Middleware-Production-Deadletter-Plays SQS


resource "aws_sqs_queue" "Middleware-Production-Deadletter-Plays" {
  name = "Middleware-Production-Deadletter-Plays"
  sqs_managed_sse_enabled = true
}

##############################################################

# MiddlewareProduction-Standard-Default SQS


resource "aws_sqs_queue" "Middleware-Production-Standard-Default" {
  name                      = "Middleware-Production-Standard-Default"
  delay_seconds             = 10
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 20
  sqs_managed_sse_enabled = true
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.Middleware-Production-Deadletter-Default.arn}\",\"maxReceiveCount\":10}"
  tags = {
    Name = "Middleware-Production-Standard-Default"
    Environment = "Prod"
  }
}

#  SQS Policy Middleware-Production-Standard-Default SQS

resource "aws_sqs_queue_policy" "prodpolicy-Standard-Default" {
  queue_url = aws_sqs_queue.Middleware-Production-Standard-Default.id

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "prod_Standard-Default_policy_ID",
  "Statement": [
    {
      "Sid": "prodpolicy-Standard-Default-ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::197937841339:root"
      },
      "Action": "SQS:*",
      "Resource": "arn:aws:sqs:us-east-1:197937841339:Middleware-Production-Standard-Default"
    }
  ]
}
POLICY
}

# Middleware-Production-Deadletter-Default SQS

resource "aws_sqs_queue" "Middleware-Production-Deadletter-Default" {
  name = "Middleware-Production-Deadletter-Default"
  sqs_managed_sse_enabled = true
}