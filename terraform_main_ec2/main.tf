locals {
  env = terraform.workspace
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr[local.env]
  name       = "vpc-${local.env}"
}

module "subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr[local.env]
  availability_zone = var.availability_zone[local.env]
  name              = "subnet-${local.env}"
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source    = "./modules/route-table"
  vpc_id    = module.vpc.vpc_id
  igw_id    = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
  ports  = var.ports[local.env]
}

module "iam" {

  source = "./modules/iam"

  environment = local.env

}

module "ec2" {
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type[local.env]
  subnet_id         = module.subnet.subnet_id
  sg_id             = module.security_group.sg_id
  key_name          = var.key_name
  availability_zone = var.availability_zone[local.env]
  volume_size       = var.volume_size[local.env]
  instance_profile  = module.iam.instance_profile

  depends_on = [module.route_table] # ✅ stability
}
