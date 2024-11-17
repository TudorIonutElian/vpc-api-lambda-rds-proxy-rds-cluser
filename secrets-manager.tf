/*
    - resource type: aws_secretsmanager_secret
    - resource name: rds_proxy_secret
    - secret_string: The secret string that contains the credentials for the RDS proxy.
*/


resource "aws_secretsmanager_secret" "rds_proxy_secret" {
  name = "rds-proxy-secret"
}

/*
    - resource type: aws_secretsmanager_secret_version
    - resource name: rds_proxy_secret_version
    - secret_id: The ID of the secret.
    - secret_string: The secret string that contains the credentials for the RDS proxy.
*/

resource "aws_secretsmanager_secret_version" "rds_proxy_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_proxy_secret.id
  secret_string = jsonencode({
    username = var.rds_cluster_username
    password = var.rds_cluster_password
  })
}