# resource "aws_instance" "web-1" {
#   #count                       = var.environment == "dev" ? 1 : 0
#   ami                         = var.imagename
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = aws_subnet.subnet1-public.id
#   vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name  = "${var.vpc_name}-Public-Server-1"
#     Env   = var.environment
#     Owner = var.owner
#   }
#   user_data = <<-EOF
# 		#!/bin/bash
#     sudo apt-get update
# 		sudo apt-get install -y nginx jq net-tools 
# 		sudo systemctl start nginx
# 		sudo systemctl enable nginx
# 		echo "<center><h1>Deployed via Terraform</h1></center>" | sudo tee /var/www/html/index.nginx-debian.html
#         echo "<center><h1>${var.vpc_name}-Public-Server-1</h1></center>" | sudo tee /var/www/html/index.nginx-debian.html
# 	EOF
#   lifecycle {
#     #create_before_destroy = true
#     #prevent_destroy = true
#     # ignore_changes = [
#     #   user_data
#     # ]
#     force_destroy = true
#   }
# }

# resource "aws_instance" "web-2" {
#   ami                         = var.imagename
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = aws_subnet.subnet2-public.id
#   vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
#   associate_public_ip_address = true
#   tags = {
#     Name  = "${var.vpc_name}-Public-Server-2"
#     Env   = var.environment
#     Owner = var.owner
#   }
#   user_data = <<-EOF
# 		#!/bin/bash
#         sudo apt-get update
# 		sudo apt-get install -y nginx jq net-tools 
# 		sudo systemctl start nginx
# 		sudo systemctl enable nginx
# 		echo "<center><h1>Deployed via Terraform</h1></center>" | sudo tee /var/www/html/index.nginx-debian.html
#         echo "<center><h1>${var.vpc_name}-Public-Server-2</h1></center>" | sudo tee /var/www/html/index.nginx-debian.html
# 	EOF
#   lifecycle {
#     #create_before_destroy = true
#     #prevent_destroy = true
#     # ignore_changes = [
#     #   user_data
#     # ]
#     force_destroy = true
#   }
# }

resource "aws_instance" "public-servers" {
  count                       = var.environment == "dev" || var.environment == "development" ? 3 : 1
  ami                         = lookup(var.imagename, "us-east-1")
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets[*].id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all_new.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-Public-Server-${count.index + 1}"
    Env        = var.environment
    Owner1     = lower(var.owner)
    Owner2     = upper(var.owner)
    appversion = var.appversion
  }

  user_data = <<-EOF
		#!/bin/bash
    sudo apt-get update
		sudo apt-get install -y nginx jq net-tools 
		sudo systemctl start nginx
		sudo systemctl enable nginx
		echo "<center><h1>Deployed via Terraform</h1></center>" | sudo tee /var/www/html/index.nginx-debian.html
        echo "<center><h1>${var.vpc_name}-Public-Server-1</h1></center>" | sudo tee /var/www/html/index.nginx-debian.html
	EOF
  lifecycle {
    #create_before_destroy = true
    # prevent_destroy = true
    # ignore_changes = [
    #   user_data
    # ]
  }
}