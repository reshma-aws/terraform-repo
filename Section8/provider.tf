provider "aws" {
    region = "us-west-2"  
}

provider "aws"{
    alias = "nvirginia"
    region = "us-west-1"
}