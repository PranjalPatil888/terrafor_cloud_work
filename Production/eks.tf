# Create Elastic IP for NAT Gateway
resource "aws_eip" "Middleware-Production-NAT-eip" {
  vpc      = true

   lifecycle {
    prevent_destroy = false
  }
}


# # Create IAM Role For EKS Cluster
# resource "aws_iam_role" "Middleware-Production-eksclusterrole" {
#   name = "Midleware-Production-eksclusterrole"

#   assume_role_policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# POLICY

#  lifecycle {
#     prevent_destroy = false
#   }
# }

# # Attach AmazonEKSClusterPolicy to the Role
# resource "aws_iam_role_policy_attachment" "Middleware-Production-AmazonEKSClusterPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.Middleware-Production-eksclusterrole.name

#    lifecycle {
#     prevent_destroy = false
#   }
# }


# # Create EKS Cluster

# resource "aws_eks_cluster" "Middleware-Production-EKS-Cluster" {
#   name     = "Middleware-Production-EKS-Cluster"
#   role_arn = aws_iam_role.Middleware-Production-eksclusterrole.arn
#   enabled_cluster_log_types = ["api","audit","authenticator","controllerManager","scheduler"]
#   encryption_config {
#     provider {
#       key_arn = aws_kms_key.Middleware-Production-EKS-CMK.arn
#     }
#     resources = ["secrets"]
    
#   }
#   vpc_config {
#     subnet_ids = [
      
#       aws_subnet.Middleware-Production-PrivatesubnetA.id,
#       aws_subnet.Middleware-Production-PrivatesubnetB.id
      
#     ]
#     security_group_ids = [aws_security_group.Middleware-Production-EKS-Securitygroup.id]
#     endpoint_private_access = true
#     endpoint_public_access  = false
#   }

#   depends_on = [aws_iam_role_policy_attachment.Middleware-Production-AmazonEKSClusterPolicy]

#    lifecycle {
#     prevent_destroy = false
#   }

# }
