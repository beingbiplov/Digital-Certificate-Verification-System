module "certificate_bucket" {
  source       = "./modules/s3"
  project_name = var.project_name
  environment  = var.environment
}

module "certificates_table" {
  source = "./modules/dynamodb"

  project_name = var.project_name
  environment  = var.environment
}
