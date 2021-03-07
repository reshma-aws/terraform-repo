terraform {
  backend "s3" {
      bucket = "reshma.terraform.bucket"
      key = "remotedemo.tfstate"
      region = "us-west-2"
    
  }
}