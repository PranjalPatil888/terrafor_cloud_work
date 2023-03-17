# # Create Subnet Group for Postgres RDS
# resource "aws_db_subnet_group" "Middleware-Production-PostgresRDS-SubnetGroup" {
#   name       = var.production_rds_subnet_group
#   subnet_ids = ["${aws_subnet.Middleware-Production-PrivatesubnetA.id}", "${aws_subnet.Middleware-Production-PrivatesubnetB.id}"]
  

#   tags = {
#     Name = "Middleware-Production-PostgresRDS-SubnetGroup"
#   }
# }




# # create RDS Postgres Instance
# resource "aws_db_instance" "Middleware_production_PostgresRDS" {
#   allocated_storage        = 20 # gigabytes
#   engine                   = "postgres" 
#   engine_version           = "13.7" 
#   db_subnet_group_name     = aws_db_subnet_group.Middleware-Production-PostgresRDS-SubnetGroup.id
#   identifier               = "outfront-production-rds" 
#   instance_class           = "db.m5.large" 
#   db_name                  = "Middleware_production_PostgresRDS" # if you have tuned it var.Postgres_name
# #   password                 = "${trimspace(file("mydb1-password.txt"))}"
#   password = "Outfront0109"
#   publicly_accessible      = false
#   iam_database_authentication_enabled = true
#   auto_minor_version_upgrade = true
#   enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
#   multi_az                 = true 
#   parameter_group_name     = aws_db_parameter_group.Middleware_production_RDS_Group.id
#   storage_encrypted        = true # you should always do this
#   storage_type             = "gp2"
#   username                 = "sonar"
#   vpc_security_group_ids   = ["${aws_security_group.Middleware-Production-PostgresRDS-sg.id}"]
#   # skip_final_snapshot      = true
#   # backup_retention_period   = 5
#   # skip_final_snapshot      = false
#   # final_snapshot_identifier = "DELETE-ME"
#   # apply_immediately         = true
# }

# # Create DB Parameter Group for RDS
# resource "aws_db_parameter_group" "Middleware_production_RDS_Group" {
#   name        = "outfront-prod-rds"
#   family      = "postgres13"

#   parameter {
#     name="log_statement"
#     value="all"
#   }

#   parameter {
#     name="log_min_duration_statement"
#     value="1"
#   }
# }
