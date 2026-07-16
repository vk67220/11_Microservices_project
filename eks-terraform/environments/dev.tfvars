############################################
# AWS
############################################

aws_region = "us-east-1"

############################################
# Project
############################################

project_name = "microservices"

environment = "dev"

############################################
# VPC
############################################

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.3.0/24",
  "10.0.4.0/24"
]

############################################
# EKS
############################################

cluster_name    = "dev-eks"
cluster_version = "1.33"

############################################
# Worker Nodes
############################################

node_instance_types = [
  "m7i-flex.large"
]

node_min_size     = 2
node_desired_size = 2
node_max_size     = 5

############################################
# EKS Access
############################################

eks_admin_principal_arn = "arn:aws:iam::302524629943:user/app_01"

github_actions_role_arn = "arn:aws:iam::302524629943:role/github-oidc-selfhosted-role"