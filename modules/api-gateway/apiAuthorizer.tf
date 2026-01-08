resource "aws_api_gateway_authorizer" "cognito" {
  name            = "cert-verification-cognito-authorizer"
  rest_api_id     = aws_api_gateway_rest_api.this.id
  type            = "COGNITO_USER_POOLS"

  identity_source = "method.request.header.Authorization"

  provider_arns = [
    module.cognito.user_pool_arn
  ]
}
