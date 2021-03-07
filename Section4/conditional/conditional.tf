resource "aws_instance" "dev" {
    ami = "ami-0e999cbd62129e3b1"
    instance_type = "t2.micro"
    count = var.istest == true ? 3 : 0
}
resource "aws_instance" "prod" {
    ami = "ami-0e999cbd62129e3b1"
    instance_type = "t2.nano"
    count = var.istest == false ? 2 : 0
}