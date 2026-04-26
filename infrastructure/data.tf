data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet" "public" {
  id = var.subnet_id
}

data "aws_internet_gateway" "igw" {
  id = var.igw_id
}

data "aws_route_table" "public_rt" {
  id = var.route_table_id
}
