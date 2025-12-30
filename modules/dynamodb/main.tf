resource "aws_dynamodb_table" "certificates" {
  name         = "${var.project_name}-${var.environment}-certificates"
  billing_mode = var.billing_mode
  hash_key     = "certificateId"

  attribute {
    name = "certificateId"
    type = "S"
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
    Service     = "certification"
  }
}
