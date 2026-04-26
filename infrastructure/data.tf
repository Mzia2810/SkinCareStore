data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}