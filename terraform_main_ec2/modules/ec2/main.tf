resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  availability_zone = var.availability_zone
  iam_instance_profile = var.instance_profile
  # ✅ ONLY THIS
  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name        = "ec2-${terraform.workspace}"
    Environment = terraform.workspace
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }
}