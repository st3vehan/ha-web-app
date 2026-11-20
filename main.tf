data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs       = slice(data.aws_availability_zones.available.names, 0, 2)
  app_cidr  = "10.0.0.0/16"
  onprem_ip = "192.168.0.0/16" # deliberately non-overlapping with the AWS VPC
}

module "network" {
  source = "./modules/network"

  name = var.project
  cidr = local.app_cidr
  azs  = local.azs
}