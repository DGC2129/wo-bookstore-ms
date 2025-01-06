resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Owner       = var.owner
    environment = var.environment
  }
}

#Print Attribute Reference Using Output
output "vpc_id" {
  value = aws_vpc.default.id
}
output "vpc_arn" {
  value = aws_vpc.default.arn
}

output "vpc_cidr_block" {
  value = aws_vpc.default.cidr_block
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}


