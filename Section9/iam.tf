terraform {
  required_version = "~> 0.14.7"
  backend "remote" {
  }
}

resource "aws_iam_user" "lb" {
    name = "remoteuser"
}