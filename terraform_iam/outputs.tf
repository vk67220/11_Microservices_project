output "iam_user_name" {
  description = "IAM user name"
  value       = aws_iam_user.app.name
}

output "iam_user_arn" {
  description = "IAM user ARN"
  value       = aws_iam_user.app.arn
}