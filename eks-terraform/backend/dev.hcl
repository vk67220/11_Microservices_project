bucket         = "my-eks-terraform-state-302524629943-us-east-1"
key            = "dev/eks/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "terraform-locks"
encrypt        = true