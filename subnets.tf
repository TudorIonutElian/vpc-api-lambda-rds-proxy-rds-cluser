resource "aws_subnet" "private_vpc_course_demo_eu_central_1a" {
  vpc_id                  = aws_vpc.private_vpc_course_demo.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

    tags = {
    Name    = "Private VPC Course Demo EU Central 1a"
    Project = "AWS Terraform Course"
  }
}

resource "aws_subnet" "private_vpc_course_demo_eu_central_1b" {
  vpc_id                  = aws_vpc.private_vpc_course_demo.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = false

    tags = {
    Name    = "Private VPC Course Demo EU Central 1b"
    Project = "AWS Terraform Course"
  }
}