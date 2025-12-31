variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "presign_lambda_invoke_arn" {
  description = "Invoke ARN of the presign Lambda"
  type        = string
}

variable "presign_lambda_name" {
  description = "Name of the presign Lambda"
  type        = string
}
