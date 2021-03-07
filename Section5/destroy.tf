resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic"

    ingress = [{
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]

  egress = [{
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}
# resource "aws_security_group" "allow_ssh" {
#   name        = "allow_ssh"
#   description = "Allow SSH inbound traffic"

#   ingress = [{
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "SSH into VPC"
#     from_port   = 22
#     protocol    = "tcp"
#     to_port     = 22
#   }]
  

# #   ingress = [{
# #     cidr_blocks = ["0.0.0.0/0"]
# #     description = "SSH into VPC"
# #     from_port   = 22
# #     protocol    = "tcp"
# #     to_port     = 22
# #   }]

#   egress = [{
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Outbound Allow"
#     from_port   = 0
#     protocol    = "tcp"
#     to_port     = 65535
#   }]

# }

resource "aws_instance" "myec2" {
  ami             = "ami-09c5e030f74651050"
  instance_type   = "t2.micro"
  key_name        = "kp-oregon"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  provisioner "remote-exec" {
      inline = [
          "sudo yum -y install nano"
      ]
  }

  provisioner "remote-exec" {
      when = destroy
      inline = [
          "sudo yum -y remove nano"
      ]
  
  }

  connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      #   private_key = "${file("/Users/Reshu/Documents/CC/PEM Files/kp-oregon.pem")}"
      private_key = file("/Users/Reshu/Documents/CC/PEM/kp-oregon.pem")
    }

}