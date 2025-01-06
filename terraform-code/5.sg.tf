# data "http" "myip" {
#   url = "https://ipv4.icanhazip.com"
# }

# resource "aws_security_group" "allow_all_new" {
#   name        = "${var.vpc_name}-Allow-All"
#   description = "Allow all inbound traffic"
#   vpc_id      = aws_vpc.default.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
#   }

#   ingress {
#     from_port   = 3389
#     to_port     = 3389
#     protocol    = "tcp"
#     cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   # lifecycle {
#   #   ignore_changes = [ingress, egress]
#   # }
# }
  