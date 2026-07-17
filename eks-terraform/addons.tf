locals {
  cluster_addons = {
    coredns = {
      #most_recent = true
      addon_version = "v1.12.4-eksbuild.1"
    }

    kube-proxy = {
      #most_recent = true
       addon_version = "v1.33.0-eksbuild.1"
    }

    vpc-cni = {
      #most_recent = true
      addon_version = "v1.20.4-eksbuild.1"
    }

    aws-ebs-csi-driver = {
      #most_recent              = true
      addon_version            = "v1.49.0-eksbuild.1"
      service_account_role_arn = aws_iam_role.ebs_csi.arn
    }
  }
}