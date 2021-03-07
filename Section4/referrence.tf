resource "aws_instance" "myec2" {
  ami           = "ami-0e999cbd62129e3b1"
  # instance_type = "t2.micro"
  # instance_type = "${var.instancetype}"  => This expression is deprecated
  instance_type = var.instancetype
  
  tags = {
    "Name" = "EC2"
  }
}

resource "aws_eip" "myeip" {
  vpc = true
}

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.myec2.id
#   allocation_id = aws_eip.myeip.id
# }

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.myeip.id
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # cidr_blocks = [aws_eip.myeip.public_ip]/32
    cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
  }
}