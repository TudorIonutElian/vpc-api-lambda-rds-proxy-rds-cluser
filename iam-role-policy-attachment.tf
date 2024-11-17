/*
    - resource type: aws_iam_policy_attachment
    - resource name: lambda_network_interface_policy_attachment
    - roles: The IAM role that the policy will be attached to.
    - policy_arn: The ARN of the IAM policy that will be attached to the role.
*/
resource "aws_iam_policy_attachment" "lambda_network_interface_policy_attachment" {
  name       = "lambda-network-interface-policy-attachment"
  roles      = [aws_iam_role.lambda_database_proxy_role.name]
  policy_arn = aws_iam_policy.lambda_network_interface_policy.arn
}