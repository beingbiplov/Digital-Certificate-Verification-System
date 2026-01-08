output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}

output "user_pool_arn" {
  value = aws_cognito_user_pool.this.arn
}

output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.this.id
}

output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}

output "user_pool_arn" {
  value = aws_cognito_user_pool.this.arn
}

output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.web_client.id
}

output "hosted_ui_domain" {
  value = aws_cognito_user_pool_domain.this.domain
}

output "hosted_ui_login_url" {
  value = "https://${aws_cognito_user_pool_domain.this.domain}.auth.${var.aws_region}.amazoncognito.com/login?client_id=${aws_cognito_user_pool_client.web_client.id}&response_type=code&scope=email+openid+profile&redirect_uri=http://localhost:3000/callback"
}

output "hosted_ui_logout_url" {
  value = "https://${aws_cognito_user_pool_domain.this.domain}.auth.${var.aws_region}.amazoncognito.com/logout?client_id=${aws_cognito_user_pool_client.web_client.id}&logout_uri=http://localhost:3000"
}
