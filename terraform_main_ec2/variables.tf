variable "aws_region" { type = string }
variable "ami" { type = string }
variable "key_name" { type = string }

variable "vpc_cidr" {
  type = map(string)
  default = {
    dev  = "10.0.0.0/16"
    qa   = "10.1.0.0/16"
    prod = "10.2.0.0/16"
  }
}

variable "subnet_cidr" {
  type = map(string)
  default = {
    dev  = "10.0.1.0/24"
    qa   = "10.1.1.0/24"
    prod = "10.2.1.0/24"
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    dev  = "t2.medium"
    qa   = "t3.small"
    prod = "c7i.2xlarge"
  }
}

variable "availability_zone" {
  type = map(string)
  default = {
    dev  = "us-east-1a"
    qa   = "us-east-1b"
    prod = "us-east-1c"
  }
}

variable "volume_size" {
  type = map(number)
  default = {
    dev  = 25
    qa   = 15
    prod = 25
  }
}

variable "ports" {
  type = map(list(number))
  default = {
    dev  = [22, 80, 8080, 8081, 9000]
    qa   = [22, 80]
    prod = [22, 80, 8080, 8081, 9000, 5432]
  }
}