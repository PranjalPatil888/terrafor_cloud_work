variable "environment" {
  description = "Deployment Environment"
  default     = "Production"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the vpc"
  default     = "10.115.128.0/18"
}

variable "public_subnet_cidr_1" {
  type        = string
  description = "CIDR block for Public Subnet"
  default     = "10.115.128.0/20"
}

variable "public_subnet_cidr_2" {
  type        = string
  description = "CIDR block for Public Subnet"
  default     = "10.115.144.0/20"
}

variable "private_subnet_cidr_1" {
  type        = string
  description = "CIDR block for Private Subnet"
  default     = "10.115.160.0/20"
}

variable "private_subnet_cidr_2" {
  type        = string
  description = "CIDR block for Private Subnet"
  default     = "10.115.176.0/20"
}

variable "region" {
  description = "Region in which the bastion host will be launched"
  default     = "us-east-1"
}


variable "environment_tag" {
  type        = string
  description = "Environment tag"
  default     = "Production"
}


variable "availability_zone_names" {
     description = "AZ for us-east-1 region"
     type = list
     default = ["us-east-1a","us-east-1b"]

}

variable "instance_type" {
    description = "Instance type for Jenkins server"
    type = list
    default = ["t2.micro","t2.medium"]
}

variable "production_rds_subnet_group" {
   
  description = "production RDS Subnet Group Name"
  type = string
  default = "middleware-production-postgres-rds-subnetgroup"
  
}

# variable "production_rds_sg" {
  
#   description = "production RDS Security Group"
#   type = string
#   default = "Middleware-production-PostgresRDS-sg"
# }