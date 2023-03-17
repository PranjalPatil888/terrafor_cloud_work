# #create Node group for eks cluster
# resource "aws_eks_node_group" "Middleware-Production-Nodegroup" {
#   cluster_name    = aws_eks_cluster.Middleware-Production-EKS-Cluster.name
#   node_group_name = "Middleware-Production-Nodegroup"
#   node_role_arn   = aws_iam_role.Middleware-Production-WorkerNoderole.arn
#   subnet_ids      = [aws_subnet.Middleware-Production-PrivatesubnetA.id , aws_subnet.Middleware-Production-PrivatesubnetB.id]
  

#   scaling_config {
#     desired_size = 1
#     max_size     = 2
#     min_size     = 1
#   }

#   # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
#   # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#   depends_on = [
#     aws_iam_role_policy_attachment.Middleware-Production-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.Middleware-Production-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.Middleware-Production-AmazonEC2ContainerRegistryReadOnly,
#   ]
# }


#######################  NEW ###############################
#  resource "aws_eks_node_group" "Middleware-Production-Nodegroup" {
#   cluster_name  = aws_eks_cluster.Middleware-Production-EKS-Cluster.name
#   node_group_name = "Middleware-Production-Nodegroup"
#   node_role_arn  = aws_iam_role.Middleware-Production-WorkerNoderole.arn
#   subnet_ids   = [aws_subnet.Middleware-Production-PrivatesubnetA.id , aws_subnet.Middleware-Production-PrivatesubnetB.id]
#   instance_types = ["t2.large"]
 
#   scaling_config {
#    desired_size = 2
#    max_size   = 3
#    min_size   = 1
#   }
 
#   depends_on = [
#    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
#    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
#    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
#   ]
#  }

  
 
