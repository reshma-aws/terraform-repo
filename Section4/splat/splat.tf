resource "aws_iam_user" "lb" {
  name  = "iamuser.${count.index}"
  count = 3
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}