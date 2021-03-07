# resource "aws_instance" "my-ec2" {
#   #   ami           = data.aws_ami.app_ami.id
#   ami             = "ami-09c5e030f74651050"
#   instance_type   = "t2.micro"
#   key_name        = "kp-oregon"
#   security_groups = ["sg-00e05511ca5d07054"]

#   provisioner "remote-exec" {
#     inline = [
#       "sudo amazon-linux-extras install -y nginx1.12",
#       "sudo systemctl start nginx"
#     ]

#     connection {
#       type = "ssh"
#       host = self.public_ip
#       user = "ec2-user"
#       #   private_key = "${file("/Users/Reshu/Documents/CC/PEM Files/kp-oregon.pem")}"
#       private_key = file("/Users/Reshu/Documents/CC/PEM/kp-oregon.pem")
#     }
#   }
# }
