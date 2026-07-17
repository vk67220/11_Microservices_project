############################################
# AWS
############################################

variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
}

############################################
# Project
############################################

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name (dev/production)"
  type        = string
}

############################################
# VPC
############################################

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones"

  type = list(string)
}

variable "public_subnets" {
  description = "Public Subnet CIDRs"

  type = list(string)
}

variable "private_subnets" {
  description = "Private Subnet CIDRs"

  type = list(string)
}

############################################
# EKS Cluster
############################################

variable "cluster_name" {
  description = "EKS Cluster Name"

  type = string
}

variable "cluster_version" {
  description = "Kubernetes Version"

  type = string
}

############################################
# Node Group
############################################

variable "node_instance_types" {
  description = "EKS Worker Node Instance Types"

  type = list(string)
}

variable "node_min_size" {
  description = "Minimum Worker Nodes"

  type = number
}

variable "node_desired_size" {
  description = "Desired Worker Nodes"

  type = number
}

variable "node_max_size" {
  description = "Maximum Worker Nodes"

  type = number
}

############################################
# EKS Access
############################################

variable "eks_admin_principal_arn" {
  description = "IAM User/Role ARN with EKS Cluster Admin Access"

  type = string
}

variable "github_actions_role_arn" {
  description = "GitHub Actions OIDC Role ARN"

  type = string
}

variable "cluster_addons" {
  description = "EKS Managed Addons"

  type = map(object({
    most_recent              = optional(bool)
    addon_version            = optional(string)
    service_account_role_arn = optional(string)
  }))

  default = {}
}