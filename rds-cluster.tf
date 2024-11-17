resource "aws_rds_cluster" "mysql_cluster" {
  cluster_identifier                  = "vpc-api-lambda-mysql-cluster"
  engine                              = "aurora-mysql"
  engine_version                      = "8.0.mysql_aurora.3.04.3"
  database_name                       = "mydb"
  master_username                     = var.rds_cluster_username
  master_password                     = var.rds_cluster_password
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  storage_encrypted                   = true
  apply_immediately                   = true
  iam_database_authentication_enabled = true
  vpc_security_group_ids              = [aws_security_group.rds_proxy_security_group.id]

  tags = {
    Name = "mysql-cluster"
  }
}

/* add a rds instance cluster to the cluster*/

resource "aws_rds_cluster_instance" "mysql_instance" {
  count              = 2
  cluster_identifier = aws_rds_cluster.mysql_cluster.id
  instance_class     = "db.t3.medium"
  engine             = "aurora-mysql"
  identifier         = "vpc-api-lambda-mysql-cluster-instance-${count.index}"
  apply_immediately  = true

  tags = {
    Name    = "Private VPC Course Demo"
    Project = "AWS Terraform Course"
  }
}