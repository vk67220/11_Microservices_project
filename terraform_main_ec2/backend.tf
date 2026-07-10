terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "cyient-dev-bucket1"
    key            = "ec2_infra/terraform.tfstate"   # ✅ FIXED
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}