############################################
# GitHub OIDC Custom Policy
############################################

resource "aws_iam_policy" "github_oidc_custom_policy" {

  name        = "github-oidc-custom-policy"

  description = "Custom IAM Policy for GitHub OIDC Terraform Deployments"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      ##########################################
      # EKS Cluster Management
      ##########################################

      {
        Sid    = "EKSClusterManagement"

        Effect = "Allow"

        Action = [

          "eks:CreateCluster",
          "eks:DeleteCluster",
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:UpdateClusterConfig",
          "eks:UpdateClusterVersion",
          "eks:DescribeClusterVersions",

          "eks:CreateNodegroup",
          "eks:DeleteNodegroup",
          "eks:DescribeNodegroup",
          "eks:ListNodegroups",
          "eks:UpdateNodegroupConfig",
          "eks:UpdateNodegroupVersion",

          "eks:CreateAccessEntry",
          "eks:DeleteAccessEntry",
          "eks:DescribeAccessEntry",
          "eks:ListAccessEntries",

          "eks:AssociateAccessPolicy",
          "eks:DisassociateAccessPolicy",
          "eks:ListAssociatedAccessPolicies",

          "eks:DescribeUpdate",
          "eks:ListUpdates",

          "eks:TagResource",
          "eks:UntagResource"

        ]

        Resource = "*"
      },

      ##########################################
      # EKS Add-ons
      ##########################################

      {
        Sid    = "EKSAddonManagement"

        Effect = "Allow"

        Action = [

          "eks:CreateAddon",
          "eks:DeleteAddon",
          "eks:DescribeAddon",
          "eks:DescribeAddonVersions",
          "eks:ListAddons",
          "eks:UpdateAddon"

        ]

        Resource = "*"
      },

      ##########################################
      # IAM Pass Role
      ##########################################

      {
        Sid    = "IAMPassRole"

        Effect = "Allow"

        Action = [

          "iam:PassRole"

        ]

        Resource = "*"
      },

      ##########################################
      # EC2
      ##########################################

      {
        Sid    = "EC2Permissions"

        Effect = "Allow"

        Action = [

          "ec2:*"

        ]

        Resource = "*"
      },

      ##########################################
      # Auto Scaling
      ##########################################

      {
        Sid    = "AutoScaling"

        Effect = "Allow"

        Action = [

          "autoscaling:*"

        ]

        Resource = "*"
      },

      ##########################################
      # Elastic Load Balancer
      ##########################################

      {
        Sid    = "ELBPermissions"

        Effect = "Allow"

        Action = [

          "elasticloadbalancing:*"

        ]

        Resource = "*"
      },

      ##########################################
      # IAM Read Permissions
      ##########################################

      {
        Sid    = "IAMRead"

        Effect = "Allow"

        Action = [

          "iam:GetRole",
          "iam:ListRoles",
          "iam:GetPolicy",
          "iam:ListPolicies",
          "iam:GetOpenIDConnectProvider"

        ]

        Resource = "*"
      },

      ##########################################
      # KMS
      ##########################################

      {
        Sid    = "KMSPermissions"

        Effect = "Allow"

        Action = [

          "kms:CreateKey",
          "kms:DescribeKey",
          "kms:ListKeys",
          "kms:ListAliases",
          "kms:CreateAlias",
          "kms:UpdateAlias",
          "kms:DeleteAlias",
          "kms:EnableKeyRotation",
          "kms:PutKeyPolicy",
          "kms:TagResource"

        ]

        Resource = "*"
      },

      ##########################################
      # CloudWatch
      ##########################################

      {
        Sid    = "CloudWatch"

        Effect = "Allow"

        Action = [

          "cloudwatch:*"

        ]

        Resource = "*"
      },

      ##########################################
      # CloudWatch Logs
      ##########################################

      {
        Sid    = "CloudWatchLogs"

        Effect = "Allow"

        Action = [

          "logs:*"

        ]

        Resource = "*"
      },

      ##########################################
      # Systems Manager
      ##########################################

      {
        Sid    = "SSM"

        Effect = "Allow"

        Action = [

          "ssm:*"

        ]

        Resource = "*"
      }

    ]

  })

}