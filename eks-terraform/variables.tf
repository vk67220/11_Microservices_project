############################################
# AWS
############################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

############################################
# Project
############################################

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "microservices"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}

############################################
# VPC
############################################

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)

  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "public_subnets" {
  description = "Public Subnet CIDR Blocks"
  type        = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private_subnets" {
  description = "Private Subnet CIDR Blocks"
  type        = list(string)

  default = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]
}

############################################
# EKS
############################################

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "dev-eks"
}

variable "cluster_version" {
  description = "EKS Kubernetes Version"
  type        = string
}

############################################
# Node Group
############################################

variable "node_instance_types" {
  description = "EC2 Instance Types for EKS Worker Nodes"
  type        = list(string)

  default = [
    "m7i-flex.large"
  ]
}

variable "node_min_size" {
  description = "Minimum Number of Worker Nodes"
  type        = number
  default     = 2
}

variable "node_desired_size" {
  description = "Desired Number of Worker Nodes"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum Number of Worker Nodes"
  type        = number
  default     = 5
}

############################################
# EKS Access
############################################

variable "eks_admin_principal_arn" {
  description = "IAM User or Role ARN for EKS Administrator Access"
  type        = string
}

variable "github_actions_role_arn" {
  description = "GitHub Actions OIDC IAM Role ARN"
  type        = string
}