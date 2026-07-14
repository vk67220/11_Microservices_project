variable "aws_region" {

  description = "AWS Region"

  type = string

}

variable "environment" {

  description = "Deployment Environment"

  type = string

}

variable "services" {

  description = "List of ECR repositories"

  type = list(string)

}