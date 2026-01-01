resource "aws_api_gateway_account" "apigateway_account" {
  cloudwatch_role_arn = aws_iam_role.apigateway_cloudwatch_role.arn
}

resource "aws_cloudwatch_log_group" "apigw_logs" {
  name              = "/aws/apigateway/cert-verification-${var.environment}"
  retention_in_days = 14
}
