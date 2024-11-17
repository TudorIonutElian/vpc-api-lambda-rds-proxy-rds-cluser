/*
  aws_iam_policy_document is a data source that generates an IAM policy document that can be referenced by other resources.
  This policy document will allow the Lambda function to assume the role and execute the function.
  - statement: The policy statement that allows the Lambda function to assume the role.
    - actions: The actions that the Lambda function is allowed to perform.
    - effect: The effect of the policy statement (Allow in this case).
    - principals: The entities that are allowed to assume the role.
      - type: The type of entity (Service in this case).
      - identifiers: The identifiers of the entity (lambda.amazonaws.com in this case).
*/

data "aws_iam_policy_document" "LambdaAWSLambdaTrustPolicy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda_network_interface" {
  statement {
    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
    ]
    effect = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "RDSProxyRDSTrustPolicy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "rds_proxy_policy" {
  statement {
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret"
    ]
    effect = "Allow"
    resources = [aws_secretsmanager_secret.rds_proxy_secret.arn]
  }

  statement {
    actions = [
      "rds-db:connect"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:rds-db:${data.aws_region.current_region.name}:${data.aws_caller_identity.current_caller.account_id}:dbuser:${aws_rds_cluster.mysql_cluster.resource_id}/master"
    ]
  }
}