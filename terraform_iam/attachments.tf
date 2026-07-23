############################################
# DynamoDB Full Access
############################################

resource "aws_iam_user_policy_attachment" "dynamodb_full_access" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

############################################
# EC2 Full Access
############################################

resource "aws_iam_user_policy_attachment" "ec2_full_access" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

############################################
# EKS Cluster Policy
############################################

resource "aws_iam_user_policy_attachment" "eks_cluster_policy" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

############################################
# S3 Full Access
############################################

resource "aws_iam_user_policy_attachment" "s3_full_access" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

############################################
# SSM Full Access
############################################

resource "aws_iam_user_policy_attachment" "ssm_full_access" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

############################################
# CloudWatch Logs Full Access
############################################

resource "aws_iam_user_policy_attachment" "cloudwatch_logs_full_access" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

############################################
# IAM Full Access
############################################

resource "aws_iam_user_policy_attachment" "iam_full_access" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

############################################
# Amazon ECR Full Access
############################################

resource "aws_iam_user_policy_attachment" "ecr_full_access" {
  user = aws_iam_user.app.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}