############################################
# GitHub OIDC Custom Policy
############################################

resource "aws_iam_policy" "github_oidc_custom_policy" {

  name        = "github-oidc-custom-policy"

  description = "Custom policy for GitHub OIDC Terraform deployments"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      ##################################################
      # EKS Cluster Management
      ##################################################

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

          "eks:CreateNodegroup",
          "eks:DeleteNodegroup",
          "eks:DescribeNodegroup",
          "eks:UpdateNodegroupConfig",
          "eks:UpdateNodegroupVersion",

          "eks:CreateAccessEntry",
          "eks:DeleteAccessEntry",
          "eks:AssociateAccessPolicy",
          "eks:DisassociateAccessPolicy",
          "eks:ListAccessEntries",
          "eks:DescribeAccessEntry",

          "eks:TagResource",
          "eks:UntagResource",

          "eks:DescribeClusterVersions"

        ]

        Resource = "*"

      },

      ##################################################
      # EKS Add-ons
      ##################################################

      {

        Sid    = "EKSAddonPermissions"

        Effect = "Allow"

        Action = [

          "eks:CreateAddon",
          "eks:DeleteAddon",
          "eks:DescribeAddon",
          "eks:UpdateAddon",
          "eks:ListAddons"

        ]

        Resource = "*"

      },

      ##################################################
      # KMS
      ##################################################

      {

        Sid    = "KMSPermissions"

        Effect = "Allow"

        Action = [

          "kms:CreateKey",
          "kms:CreateAlias",
          "kms:DescribeKey",
          "kms:EnableKeyRotation",
          "kms:TagResource",
          "kms:PutKeyPolicy",
          "kms:UpdateAlias",
          "kms:DeleteAlias"

        ]

        Resource = "*"

      }

    ]

  })

}