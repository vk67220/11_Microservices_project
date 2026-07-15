############################################
# APP Inline Policy
############################################

resource "aws_iam_user_policy" "app_01_policy" {
  name = "app_policy"
  user = aws_iam_user.app.name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [

      ########################################
      # EKS Cluster Management
      ########################################

      {
        Sid    = "EKSClusterManagement"
        Effect = "Allow"

        Action = [
          "eks:CreateCluster",
          "eks:DescribeCluster",
          "eks:DeleteCluster",
          "eks:UpdateClusterConfig",
          "eks:UpdateClusterVersion",
          "eks:TagResource",
          "eks:ListClusters",

          "eks:CreateAccessEntry",
          "eks:DeleteAccessEntry",
          "eks:DescribeAccessEntry",
          "eks:ListAccessEntries",
          "eks:AssociateAccessPolicy",
          "eks:DisassociateAccessPolicy",
          "eks:ListAssociatedAccessPolicies",

          "eks:CreateNodegroup",
          "eks:DeleteNodegroup",
          "eks:DescribeNodegroup",
          "eks:UpdateNodegroupConfig",
          "eks:UpdateNodegroupVersion",

          "eks:DescribeClusterVersions"
        ]

        Resource = "*"
      },

      ########################################
      # EKS Add-on Management
      ########################################

      {
        Sid    = "EKSAddonPermissions"
        Effect = "Allow"

        Action = [
          "eks:CreateAddon",
          "eks:DescribeAddon",
          "eks:ListAddons",
          "eks:UpdateAddon",
          "eks:DeleteAddon"
        ]

        Resource = "*"
      },

      ########################################
      # KMS Management
      ########################################

      {
        Sid    = "KMSPermissions"
        Effect = "Allow"

        Action = [
          "kms:CreateKey",
          "kms:TagResource",
          "kms:DescribeKey",
          "kms:CreateAlias",
          "kms:EnableKeyRotation",
          "kms:PutKeyPolicy",
          "kms:DeleteAlias",
          "kms:UpdateAlias"
        ]

        Resource = "*"
      }
    ]
  })
}