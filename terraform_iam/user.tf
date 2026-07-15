############################################
# IAM User
############################################

resource "aws_iam_user" "app" {
  name = var.iam_user_name

  tags = {
    Name        = var.iam_user_name
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}