terraform {
  backend "s3" {
    bucket         = "reshma-terraform-bucket"
    key            = "s3lock.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-db"
  }
}