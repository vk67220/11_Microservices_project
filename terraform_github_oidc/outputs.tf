############################################
# GitHub OIDC Provider
############################################

output "github_oidc_provider_arn" {

  description = "GitHub OIDC Provider ARN"

  value = aws_iam_openid_connect_provider.github.arn

}

############################################
# GitHub IAM Role
############################################

output "github_oidc_role_name" {

  description = "GitHub OIDC IAM Role Name"

  value = aws_iam_role.github_oidc_role.name

}

output "github_oidc_role_arn" {

  description = "GitHub OIDC IAM Role ARN"

  value = aws_iam_role.github_oidc_role.arn

}