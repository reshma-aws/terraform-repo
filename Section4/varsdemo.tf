# resource "aws_security_group" "var_demo" {
#   name = "terra-variables"

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = [var.vpn_ip]

#   }
# }