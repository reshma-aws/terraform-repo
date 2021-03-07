terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# provider "aws" {
#   region     = "us-west-2"
#   access_key = "AKIATAHEOYSSE2DGJ6CD"
#   secret_key = "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"
# }

resource "aws_instance" "myec2" {
  ami           = "ami-0e999cbd62129e3b1"
  instance_type = "t2.micro"
  tags = {
    "Name" = "EC2"
  }
}