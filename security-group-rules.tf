/*
    - resource type: aws_security_group_rule
    - resource name: lambda_rds_proxy_egress_rule
    - type: egress
    - from_port: 443
    - to_port: 443
    - protocol: tcp
    - security_group_id: aws_security_group.lambda_security_group.id
    - source_security_group_id: aws_security_group.rds_proxy_security_group.id
*/
resource "aws_security_group_rule" "lambda_rds_proxy_egress_rule" {
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.lambda_security_group.id
  source_security_group_id = aws_security_group.rds_proxy_security_group.id
}

/*
    - resource type: aws_security_group_rule
    - resource name: rds_proxy_lambda_ingress_rule
    - type: ingress
    - from_port: 3306
    - to_port: 3306
    - protocol: tcp
    - security_group_id: aws_security_group.rds_proxy_security_group.id
    - source_security_group_id: aws_security_group.rds_proxy_security_group.id
*/

resource "aws_security_group_rule" "rds_proxy_lambda_ingress_rule" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_proxy_security_group.id
  source_security_group_id = aws_security_group.rds_proxy_security_group.id
}

/*
    - resource type: aws_security_group_rule
    - resource name: rds_cluster_rds_proxy_ingress_rule
    - type: ingress
    - from_port: 3306
    - to_port: 3306
    - protocol: tcp
    - security_group_id: aws_security_group.rds_cluster_security_group.id
    - source_security_group_id: aws_security_group.rds_proxy_security_group.id
*/
resource "aws_security_group_rule" "rds_cluster_rds_proxy_ingress_rule" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_cluster_security_group.id
  source_security_group_id = aws_security_group.rds_proxy_security_group.id
}

/*
    - resource type: aws_security_group_rule
    - resource name: rds_cluster_rds_proxy_egress_rule
    - type: egress
    - from_port: 3306
    - to_port: 3306
    - protocol: tcp
    - security_group_id: aws_security_group.rds_cluster_security_group.id
    - source_security_group_id: aws_security_group.rds_proxy_security_group.id
*/
resource "aws_security_group_rule" "rds_cluster_rds_proxy_egress_rule" {
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_cluster_security_group.id
  source_security_group_id = aws_security_group.rds_proxy_security_group.id
}