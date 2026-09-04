module "wif" {
  source = "stage.dev.stackgen.com/enterprise/wif-pool/gcp"

  project_id  = var.locals_project_id
  enabled     = var.enable_wif
  pool_id     = var.wif_pool_id
  provider_id = var.wif_provider_id
  issuer_uri  = var.wif_issuer_uri

  pool_display_name     = "LCS Landing Zone CI/CD"
  provider_display_name = "LCS Landing Zone CI/CD Provider"

  attribute_mapping   = var.wif_attribute_mapping
  attribute_condition = var.wif_attribute_condition

}