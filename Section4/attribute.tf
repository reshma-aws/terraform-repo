# resource "aws_eip" "myeip" {
#     vpc = true
# }
# output "eip" {
#     value = aws_eip.myeip.public_ip
# }

# resource "aws_s3_bucket" "my-s3" {
#     bucket = "reshma-terraform-section45"  
# }
# output "mys3bucket" {
#     value = aws_s3_bucket.my-s3
# }