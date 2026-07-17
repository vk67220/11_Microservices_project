resource "aws_kms_key" "eks" {

  description             = "EKS Secret Encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  tags = {
    Name = "${local.name}-eks-kms"
  }
}

resource "aws_kms_alias" "eks" {

  name = "alias/${local.name}-eks"

  target_key_id = aws_kms_key.eks.key_id
}