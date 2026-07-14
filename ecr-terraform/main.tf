resource "aws_ecr_repository" "services" {

  for_each = toset(var.services)

  name = each.value

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {

    scan_on_push = true

  }

  encryption_configuration {

    encryption_type = "AES256"

  }

  force_delete = true

  tags = {

    Name        = each.value

    Environment = var.environment

    Terraform   = "true"

    Project     = "Microservices"

    Service     = each.value

  }

}