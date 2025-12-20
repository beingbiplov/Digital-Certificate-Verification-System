# API Gateway for Certificate Verification
resource "aws_api_gateway_rest_api" "certificate_api" {
  name = "cert-verification-${var.environment}-api"
}

# Resource for certificates endpoint
resource "aws_api_gateway_resource" "certificates" {
  rest_api_id = aws_api_gateway_rest_api.certificate_api.id
  parent_id   = aws_api_gateway_rest_api.certificate_api.root_resource_id
  path_part   = "certificates"
}

# Method for POST /certificates
resource "aws_api_gateway_method" "post_certificate" {
  rest_api_id   = aws_api_gateway_rest_api.certificate_api.id
  resource_id   = aws_api_gateway_resource.certificates.id
  http_method   = "POST"
  authorization = "NONE"
}

# Integration with Lambda
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = aws_api_gateway_rest_api.certificate_api.id
  resource_id = aws_api_gateway_resource.certificates.id
  http_method = aws_api_gateway_method.post_certificate.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

# Deployment and Stage
resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.certificate_api.id

  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]
}

#  Stage for the API
resource "aws_api_gateway_stage" "stage" {
  stage_name    = var.environment
  rest_api_id   = aws_api_gateway_rest_api.certificate_api.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}

# Permission for API Gateway to invoke Lambda
resource "aws_lambda_permission" "allow_apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.certificate_api.execution_arn}/*/*"
}
