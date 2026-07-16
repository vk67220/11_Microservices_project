############################################
# AmazonEC2FullAccess
############################################

resource "aws_iam_role_policy_attachment" "ec2" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"

}

############################################
# AmazonEKSClusterPolicy
############################################

resource "aws_iam_role_policy_attachment" "eks" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}

############################################
# AmazonS3FullAccess
############################################

resource "aws_iam_role_policy_attachment" "s3" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"

}

############################################
# AmazonDynamoDBFullAccess
############################################

resource "aws_iam_role_policy_attachment" "dynamodb" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"

}

############################################
# AmazonSSMFullAccess
############################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"

}

############################################
# CloudWatchLogsFullAccess
############################################

#resource "aws_iam_role_policy_attachment" "cloudwatch_logs" {

# role       = aws_iam_role.github_oidc_role.name
#policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"

#}

############################################
# IAMFullAccess
############################################

resource "aws_iam_role_policy_attachment" "iam" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"

}

############################################
# Custom GitHub OIDC Policy
############################################

resource "aws_iam_role_policy_attachment" "custom_policy" {

  role       = aws_iam_role.github_oidc_role.name
  policy_arn = aws_iam_policy.github_oidc_custom_policy.arn

}