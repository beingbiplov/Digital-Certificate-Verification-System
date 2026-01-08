resource "aws_cognito_user_pool_client" "web_client" {
  name         = "${var.project_name}-web-client"
  user_pool_id = aws_cognito_user_pool.this.id

  # OAuth configuration
  allowed_oauth_flows = [
    "code"
  ]

  allowed_oauth_scopes = [
    "email",
    "openid",
    "profile"
  ]

  allowed_oauth_flows_user_pool_client = true

  supported_identity_providers = [
    "COGNITO"
  ]

  # Callback URLs
  callback_urls = [
    "http://localhost:3000/callback",
    "http://localhost:3000",
    "http://localhost:5000/callback"
  ]

  logout_urls = [
    "http://localhost:3000",
    "http://localhost:5000"
  ]

  # Token validity
  access_token_validity  = 60
  id_token_validity      = 60
  refresh_token_validity = 30

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }

  generate_secret = false
  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]
}
