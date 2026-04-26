data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet" "public" {
  id = var.subnet_id
}
