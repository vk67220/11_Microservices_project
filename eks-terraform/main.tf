############################################
# Local Values
############################################

locals {
  name = "${var.project_name}-${var.environment}"
}

############################################
# VPC
############################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${local.name}-vpc"
  cidr = var.vpc_cidr

  azs = var.availability_zones

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  ##########################################
  # Public Subnets
  ##########################################

  map_public_ip_on_launch = true

  ##########################################
  # NAT Gateway
  ##########################################

  enable_nat_gateway = true

  # One NAT Gateway for all private subnets.
  # Good for dev and cost optimization.
  single_nat_gateway = true

  ##########################################
  # DNS
  ##########################################

  enable_dns_hostnames = true
  enable_dns_support   = true

  ##########################################
  # Kubernetes Public Load Balancer Tags
  ##########################################

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  ##########################################
  # Kubernetes Internal Load Balancer Tags
  ##########################################

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags = {
    Name = "${local.name}-vpc"
  }
}

############################################
# EKS Cluster
############################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  ##########################################
  # Cluster
  ##########################################

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  ##########################################
  # Networking
  ##########################################

  vpc_id = module.vpc.vpc_id

  # Worker nodes are created in private subnets
  subnet_ids = module.vpc.private_subnets

  ##########################################
  # EKS API Endpoint
  ##########################################

  cluster_endpoint_public_access = true

  cluster_endpoint_private_access = true

  ##########################################
  # EKS Managed Node Group
  ##########################################

  eks_managed_node_groups = {

    default = {

      name = "${var.cluster_name}-node-group"

      instance_types = var.node_instance_types

      capacity_type = "ON_DEMAND"

      min_size = var.node_min_size

      desired_size = var.node_desired_size

      max_size = var.node_max_size

      ######################################
      # Disk
      ######################################

      disk_size = 50

      ######################################
      # Node Labels
      ######################################

      labels = {
        Environment = var.environment
        NodeGroup   = "default"
      }

      tags = {
        Name = "${var.cluster_name}-node-group"
      }
    }
  }

  ##########################################
  # EKS Access Entries
  ##########################################

  access_entries = {

    ########################################
    # IAM User Admin Access
    ########################################

    admin = {

      principal_arn = var.eks_admin_principal_arn

      policy_associations = {

        cluster_admin = {

          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }

    ########################################
    # GitHub Actions Access
    ########################################

    github_actions = {

      principal_arn = var.github_actions_role_arn

      policy_associations = {

        cluster_admin = {

          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  ##########################################
  # Tags
  ##########################################

  tags = {
    Name = var.cluster_name
  }

  depends_on = [
    module.vpc
  ]
}