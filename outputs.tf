output "certificate_bucket_name" {
  value = module.certificate_bucket.bucket_name
}

output "dynamodb_table_name" {
  value = module.certificates_table.table_name
}

output "dynamodb_table_arn" {
  value = module.certificates_table.table_arn
}