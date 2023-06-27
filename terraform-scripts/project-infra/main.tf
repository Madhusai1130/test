module "vpc" {
  source              = "../tf-module-vpc"
  env                 = var.env
  default_vpc_id      = var.default_vpc_id
  for_each            = var.vpc
  cidr_block          = each.value.cidr_block //holds all cidr blocks lists from vpc
  public_subnets      = each.value.public_subnets // holds all subnet maps from vpc
  private_subnets     = each.value.private_subnets
  availability_zone   = each.value.availability_zone
}

module "eks" {
  source                 = "../tf-module-eks"
  ENV                    = var.env
  PRIVATE_SUBNET_IDS     = lookup(lookup(lookup(lookup(module.vpc, "main", null), "private_subnet_ids", null), "app", null), "subnet_ids", null)
  PUBLIC_SUBNET_IDS      = lookup(lookup(lookup(lookup(module.vpc, "main", null), "public_subnet_ids", null), "public", null), "subnet_ids", null)
  DESIRED_SIZE           = 2
  MAX_SIZE               = 2
  MIN_SIZE               = 2
  CREATE_PARAMETER_STORE = true
}
