resource "aws_eip" "myeip"{
    vpc = "true"
}

resource "aws_eip" "myeip-01"{
    vpc = "true"
    provider = aws.nvirginia
}