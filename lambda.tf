resource "aws_lambda_function" "lambda_database_proxy_function" {
  filename         = data.archive_file.lambda_database_proxy_archive.output_path
  source_code_hash = data.archive_file.lambda_database_proxy_archive.output_base64sha256
  function_name    = "lambda-database-proxy-func"
  role             = aws_iam_role.lambda_database_proxy_role.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  depends_on       = [data.archive_file.lambda_database_proxy_archive]

  tags = {
    Name    = "lambda-database-proxy-func"
    Project = "lambda-database-proxy"
  }

  vpc_config {
    subnet_ids         = [aws_subnet.private_vpc_course_demo_eu_central_1a.id, aws_subnet.private_vpc_course_demo_eu_central_1b.id]
    security_group_ids = [aws_security_group.lambda_security_group.id]
  }

}