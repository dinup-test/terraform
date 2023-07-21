
resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_vpc_info.vpc_cidr

  tags = {
    Name = "ntier"
  }
}

resource "aws_subnet" "subnets" {

  count = length(var.ntier_vpc_info.subnet_names)

  vpc_id            = local.vpc_id #explicit dependency
  cidr_block        = cidrsubnet(var.ntier_vpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.ntier_vpc_info.subnet_azs[count.index]}"
  tags = {
    Name = var.ntier_vpc_info.subnet_names[count.index]
  }
  depends_on = [local.vpc_id]

}


resource "aws_internet_gateway" "ntier_igw" {

  vpc_id = local.vpc_id
  tags = {
    Name = "ntier-igw"
  }

  depends_on = [local.vpc_id]

}

resource "aws_route_table" "private" {

  vpc_id = local.vpc_id
  tags = {
    Name = "private_rtb"
  }

  depends_on = [aws_subnet.subnets]




}

resource "aws_route_table" "public" {

  vpc_id = local.vpc_id

  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.ntier_igw.id
  }
  tags = {
    Name = "public_rtb"
  }

  depends_on = [aws_subnet.subnets]




}



data "aws_subnets" "public" {

  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.public_subnets

  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }


  depends_on = [aws_subnet.subnets]

}


data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.private_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }

  depends_on = [aws_subnet.subnets]

}





