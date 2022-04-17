resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr_value
  instance_tenancy = "default"

  tags = {
    "Name" = "my vpc"
  }
}
