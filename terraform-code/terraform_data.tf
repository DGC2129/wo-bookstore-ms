# # null_resource is replaced by terraform_data. terraform_data is inbuilt in terraform 0.12 and above and no need to install any plugin.
# # so, terraform init is not required.

# resource "null_resource" "cluster" {
#   depends_on = [null_resource.cluster]
#   count      = var.environment == "dev" || var.environment == "development" ? 3 : 1

#   provisioner "file" {
#     source      = "script.sh"
#     destination = "/tmp/script.sh"
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("aws_login.pem")
#       #host     = "${aws_instance.web-1.public_ip}"
#       host = element(aws_instance.public-servers.*.public_ip, count.index)
#     }
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod 777 /tmp/script.sh",
#       "sudo /tmp/script.sh"
#       #   "sudo apt update",
#       #   "sudo apt install jq unzip -y",
#       #   "sudo sed -i '/<h1>Welcome.*/a <h1>${var.vpc_name}-PublicServer-${count.index + 1}</h1>' /var/www/html/index.nginx-debian.html"

#     ]
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("aws_login.pem")
#       #host     = "${aws_instance.web-1.public_ip}"
#       host = element(aws_instance.public-servers.*.public_ip, count.index)
#     }
#   }
#   #This resouce will be recreated if there is a changein tag version.
#   #   triggers = {
#   #     public-servers-tags = join(",", aws_instance.public-servers[*].tags.Version)
#   #   }

# }

