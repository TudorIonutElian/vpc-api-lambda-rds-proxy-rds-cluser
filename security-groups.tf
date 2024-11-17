/* 
    - Create a security group for the Lambda function. 
    - This security group will be associated with the Lambda function
    - Will allow outbound traffic on port 443 to the RDS Proxy
*/
resource "aws_security_group" "lambda_security_group" {
  name = "lambda_security_group"
  vpc_id = aws_vpc.private_vpc_course_demo.id

  tags = {
    Name    = "Lambda Security Group"
    Project = "AWS Terraform Course"
  }
}

/* 
    - Create a security group for the RDS Proxy. 
    - This security group will be associated with the RDS Proxy
    - Will allow outbound traffic on port 3306 to the RDS instance
    - Will allow inbound traffic on port 3306 from the Lambda function
*/

resource "aws_security_group" "rds_proxy_security_group" {
  name = "rds_proxy_security_group"
  vpc_id = aws_vpc.private_vpc_course_demo.id

  tags = {
    Name    = "RDS Proxy Security Group"
    Project = "AWS Terraform Course"
  }
}

/* 
    - Create a security group for the RDS Cluster. 
    - This security group will be associated with the RDS Cluster
    - Will allow inbound traffic on port 3306 from the RDS Proxy
*/

resource "aws_security_group" "rds_cluster_security_group" {
  name = "rds_cluster_security_group"
  vpc_id = aws_vpc.private_vpc_course_demo.id

  tags = {
    Name    = "RDS Cluster Security Group"
    Project = "AWS Terraform Course"
  }
}