locals {
  cluster_addons = {
    coredns = {
      most_recent = true
     
    }

    kube-proxy = {
      most_recent = true
   
    }

    vpc-cni = {
      most_recent = true
      
    }

    aws-ebs-csi-driver = {
      most_recent              = true
      service_account_role_arn = aws_iam_role.ebs_csi.arn
    }
  }
}