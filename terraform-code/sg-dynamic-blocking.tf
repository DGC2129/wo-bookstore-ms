data "http" "myip2" {
  url = "https://ipv4.icanhazip.com"
}

locals {
  inbound_ports  = toset(var.inbound_ports)
  outbound_ports = toset(var.outbound_ports)
}

resource "aws_security_group" "allow_all_new" {
  name        = "${var.vpc_name}-Allow-All_new"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id


  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip2.response_body)}/32"]
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip2.response_body)}/32"]
    }
  }

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
  #     egress {
  #       from_port   = 0
  #       to_port     = 0
  #       protocol    = "-1"
  #       cidr_blocks = ["0.0.0.0/0"]
  #     }
  #     # lifecycle {
  #     #   ignore_changes = [ingress, egress]
  #     # }
}