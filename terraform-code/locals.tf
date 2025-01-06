

locals {
  private_subnet_cidrs = distinct(var.private_subnet_cidrs)
  public_subnet_cidrs  = distinct(var.public_subnet_cidrs)
  azs                  = distinct(var.azs)
}