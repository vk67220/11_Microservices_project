############################################
# Local Values
############################################

locals {
  name = "${var.project_name}-${var.environment}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${local.name}-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  map_public_ip_on_launch = true
  enable_nat_gateway      = true
  single_nat_gateway      = true
  enable_dns_hostnames    = true
  enable_dns_support      = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags = {
    Name = "${local.name}-vpc"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  authentication_mode                      = "API"
  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true

  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  cluster_encryption_config = {
    resources = [
      "secrets"
    ]

    provider_key_arn = aws_kms_key.eks.arn
  }


  cluster_addons = local.cluster_addons

  eks_managed_node_groups = {
    default = {
      name           = "${var.cluster_name}-node-group"
      instance_types = var.node_instance_types
      capacity_type  = "ON_DEMAND"

      min_size     = var.node_min_size
      desired_size = var.node_desired_size
      max_size     = var.node_max_size

      ami_type  = "AL2023_x86_64_STANDARD"
      disk_size = 50

      update_config = {
        max_unavailable_percentage = 25
      }

      labels = {
        Environment = var.environment
        NodeGroup   = "default"
        ManagedBy   = "Terraform"
      }

      tags = {
        Name = var.cluster_name
      }
    }
  }

  access_entries = {
    admin = {
      principal_arn = var.eks_admin_principal_arn

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }

    # Uncomment later if needed
    #github_actions = {
    # principal_arn = var.github_actions_role_arn

    #policy_associations = {
    # admin = {
    #  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

    #          access_scope = {
    #           type = "cluster"
    #        }
    #     }
    #  }
    #}
  }

  tags = {
    Name        = var.cluster_name
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  depends_on = [
    module.vpc
  ]
}