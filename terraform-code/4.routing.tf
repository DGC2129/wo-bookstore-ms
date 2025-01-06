resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
  tags = {
    Name = "${var.vpc_name}-Main-Public-Route-Table"
  }
}

resource "aws_route_table" "terraform-private" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-Main-Private-Route-Table"
  }
}

resource "aws_route_table_association" "public-subnet-assosiation" {
  #count          = 3                                                     # 0 1 2
  count          = length(local.public_subnet_cidrs)                     # 0 1 2
  subnet_id      = element(aws_subnet.public-subnets[*].id, count.index) # splat operator
  route_table_id = aws_route_table.terraform-public.id
}

resource "aws_route_table_association" "private-subnet-assosiation" {
  #count          = 3                                                     # 0 1 2
  count          = length(local.private_subnet_cidrs)                     # 0 1 2
  subnet_id      = element(aws_subnet.private-subnets[*].id, count.index) # splat operator
  route_table_id = aws_route_table.terraform-private.id
}

# resource "aws_route_table_association" "terraform-publicsubnet-2" {
#   subnet_id      = aws_subnet.subnet2-public.id
#   route_table_id = aws_route_table.terraform-public.id
# }

# resource "aws_route_table_association" "terraform-publicsubnet-3" {
#   subnet_id      = aws_subnet.subnet3-public.id
#   route_table_id = aws_route_table.terraform-public.id
# }
