############################################
# GitHub OIDC Provider
############################################

resource "aws_iam_openid_connect_provider" "github" {

  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
}

############################################
# GitHub OIDC IAM Role
############################################

resource "aws_iam_role" "github_oidc_role" {

  name = var.github_oidc_role_name

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Federated = aws_iam_openid_connect_provider.github.arn

        }

        Action = "sts:AssumeRoleWithWebIdentity"

        Condition = {

          StringEquals = {

            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"

          }

          StringLike = {

            "token.actions.githubusercontent.com:sub" = "repo:${var.github_owner}/${var.github_repository}:*"

          }

        }

      }

    ]

  })

  tags = {

    Name        = var.github_oidc_role_name
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"

  }

}

############################################
# Attach AmazonEC2FullAccess
############################################

resource "aws_iam_role_policy_attachment" "ec2" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"

}

############################################
# Attach AmazonEKSClusterPolicy
############################################

resource "aws_iam_role_policy_attachment" "eks" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}

############################################
# Attach AmazonS3FullAccess
############################################

resource "aws_iam_role_policy_attachment" "s3" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"

}

############################################
# Attach AmazonDynamoDBFullAccess
############################################

resource "aws_iam_role_policy_attachment" "dynamodb" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"

}

############################################
# Attach AmazonSSMFullAccess
############################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"

}

############################################
# Attach CloudWatchLogsFullAccess
############################################

resource "aws_iam_role_policy_attachment" "cloudwatch" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"

}

############################################
# Attach IAMFullAccess
############################################

resource "aws_iam_role_policy_attachment" "iam" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"

}