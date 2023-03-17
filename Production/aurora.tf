

# # Create Aurora Cluster
# resource "aws_rds_cluster" "Middleware-Prod-Aurora-Cluster" {
#   cluster_identifier      = "middlewareprodauroracluster"
#   engine                  = "aurora-postgresql"
#   availability_zones      = [var.availability_zone_names[0], var.availability_zone_names[1]]
#   database_name           = "outfront"
  
#   iam_database_authentication_enabled = true
#   db_subnet_group_name     = aws_db_subnet_group.Middleware-prod-PostgresRDS-SubnetGroup.id
#   master_username         = "outfront"
#   master_password         = "outfront"
#   vpc_security_group_ids = ["${aws_security_group.Middleware-prod-PostgresRDS-sg.id}"]
# }

#  resource "aws_rds_cluster" "Middleware-Production-Aurora-Cluster" {
#   cluster_identifier = "middlewareproductionauroracluster"
#   engine             = "aurora-postgresql"
#   availability_zones = [var.availability_zone_names[0], var.availability_zone_names[1]]
#   database_name      = "outfront"
#   db_subnet_group_name  = aws_db_subnet_group.Middleware-Production-PostgresRDS-SubnetGroup.id
#   master_username    = "outfront"
#   master_password    = "outfront"
#   vpc_security_group_ids   = ["${aws_security_group.Middleware-Production-PostgresRDS-sg.id}"]
#   skip_final_snapshot      = true
#   apply_immediately = false
#   backup_retention_period = 0
#   # final_snapshot_identifier = "DELETE-ME"
#  }

# resource "aws_rds_cluster_instance" "cluster_instances" {
#   count              = 2
#   identifier         = "middlewareproductionauroracluster-${count.index}"
#   cluster_identifier = aws_rds_cluster.Middleware-Production-Aurora-Cluster.id
#   instance_class     = "db.r5.2xlarge"
#   engine             = aws_rds_cluster.Middleware-Production-Aurora-Cluster.engine
#   engine_version     = aws_rds_cluster.Middleware-Production-Aurora-Cluster.engine_version
# }

