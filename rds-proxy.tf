resource "aws_db_proxy" "mysql_cluster_proxy" {
  name                   = "mysql-cluster-proxy"
  debug_logging          = false
  engine_family          = "MYSQL"
  idle_client_timeout    = 1800
  require_tls            = true
  role_arn               = aws_iam_role.rds_proxy_role.arn
  vpc_security_group_ids = [aws_security_group.rds_proxy_security_group.id]
  vpc_subnet_ids = [
    aws_subnet.private_vpc_course_demo_eu_central_1a.id,
    aws_subnet.private_vpc_course_demo_eu_central_1b.id,
  ]

  auth {
    auth_scheme = "SECRETS"
    description = "MySQL cluster proxy auth"
    iam_auth    = "REQUIRED"
    secret_arn  = aws_secretsmanager_secret.rds_proxy_secret.arn
  }

  tags = {
    Name = "example"
    Key  = "value"
  }
}