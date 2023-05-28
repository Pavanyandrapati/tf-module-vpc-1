resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(var.tags,{"Name"="${var.env}-vpc"})
}

module "subnets" {
  source = "./subnets"
   vpc_id = aws_vpc.main.id
  for_each = var.subnets
  cidr_block= each.value["cidr_block"]
  env =var.env
  tags =var.tags
}