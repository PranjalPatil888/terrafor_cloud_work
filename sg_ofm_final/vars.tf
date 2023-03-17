variable "environment" {
  description = "Deployment Environment"
  default     = "Production"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the vpc"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_1" {
  type        = string
  description = "CIDR block for Public Subnet"
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr_2" {
  type        = string
  description = "CIDR block for Public Subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_1" {
  type        = string
  description = "CIDR block for Private Subnet"
  default     = "10.0.6.0/24"
}

variable "private_subnet_cidr_2" {
  type        = string
  description = "CIDR block for Private Subnet"
  default     = "10.0.7.0/24"
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
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b"]

}

variable "instance_type" {
  description = "Instance type for Jenkins server"
  type        = list(any)
  default     = ["t2.micro", "t2.medium"]
}
