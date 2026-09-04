module "stage_state_access" {
  source   = "stage.dev.stackgen.com/enterprise/bucket-iam-prefix/gcp"
  for_each = var.locals_stage_service_accounts

  bucket_name = var.locals_state_bucket_name
  member      = "serviceAccount:${var.module_stage_service_accounts[each.key].email}"
  prefix      = each.value.state_prefix
  title       = "Restrict to ${each.key} state prefix"
}