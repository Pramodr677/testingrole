resource "aws_vpc" "nginx" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy

  tags = var.tags_vpc
}