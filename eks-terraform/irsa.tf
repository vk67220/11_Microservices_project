data "aws_iam_policy_document" "ebs_csi_assume_role" {

  statement {

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {

      type = "Federated"

      identifiers = [
        module.eks.oidc_provider_arn
      ]
    }

    condition {

      test = "StringEquals"

      variable = "${replace(module.eks.oidc_provider, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:ebs-csi-controller-sa"
      ]
    }
  }
}

resource "aws_iam_role" "ebs_csi" {

  name = "${local.name}-ebs-csi-role"

  assume_role_policy = data.aws_iam_policy_document.ebs_csi_assume_role.json
}

resource "aws_iam_role_policy_attachment" "ebs_csi" {

  role = aws_iam_role.ebs_csi.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"

}