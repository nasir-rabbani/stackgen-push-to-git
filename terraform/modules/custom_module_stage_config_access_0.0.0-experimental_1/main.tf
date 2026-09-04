module "stage_config_access" {
  source   = "stage.dev.stackgen.com/enterprise/bucket-iam-prefix/gcp"
  for_each = var.locals_stage_service_accounts

  bucket_name = var.module_config_bucket.name
  member      = "serviceAccount:${var.module_stage_service_accounts[each.key].email}"
  prefix      = each.key
  title       = "Restrict to ${each.key} config prefix"
}