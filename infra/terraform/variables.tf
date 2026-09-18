variable "project" {
  type        = string
  description = "Project name prefix"
  default     = "ecommerce"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/staging/prod)"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for security groups"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for RDS"
}

variable "db_name" {
  type        = string
  default     = "ecommerce_db"
}

variable "db_username" {
  type        = string
}

variable "db_password" {
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  type        = string
  sensitive   = true
}
