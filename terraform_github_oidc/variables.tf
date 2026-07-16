############################################
# AWS
############################################

variable "aws_region" {

  description = "AWS Region"

  type = string

  default = "us-east-1"

}

############################################
# Project
############################################

variable "project_name" {

  description = "Project Name"

  type = string

  default = "microservices"

}

############################################
# Environment
############################################

variable "environment" {

  description = "Environment"

  type = string

  default = "dev"

}

############################################
# GitHub
############################################

variable "github_owner" {

  description = "GitHub Organization or Username"

  type = string

}

variable "github_repository" {

  description = "GitHub Repository Name"

  type = string

}

############################################
# IAM Role
############################################

variable "github_oidc_role_name" {

  description = "GitHub OIDC IAM Role Name"

  type = string

  default = "github-oidc-selfhosted-role"

}