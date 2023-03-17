#Create Production Subnet group for Elasticache Cluster
resource "aws_elasticache_subnet_group" "Middleware-Production-Redis-SubnetGroup" {
  name       = "Middleware-Production-Redis-SubnetGroup"
  subnet_ids = [aws_subnet.Middleware-Production-PrivatesubnetA.id , aws_subnet.Middleware-Production-PrivatesubnetB.id]
  

  tags = {
    Name = "Middleware-Production-Redis-SubnetGroup"
  }
}

# Create Elasticache Production Cluster
resource "aws_elasticache_cluster" "middleware-production-redis-cluster" {
  cluster_id           = "middleware-production-redis-cluster"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  engine_version       = "6.2"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.Middleware-Production-Redis-SubnetGroup.id
  security_group_ids   = [aws_security_group.Middleware-Production-Redis-sg.id]
  
}


