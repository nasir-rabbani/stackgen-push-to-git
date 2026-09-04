module "stage_upstream_state_read" {
  source   = "stage.dev.stackgen.com/enterprise/bucket-iam-prefix/gcp"
  for_each = var.locals_stage_upstream_state_access

  bucket_name = var.locals_state_bucket_name
  member      = "serviceAccount:${var.module_stage_service_accounts[each.value.stage].email}"
  prefix      = each.value.prefix
  role        = "roles/storage.objectViewer"
  title       = "Read upstream ${each.value.prefix} for ${each.value.stage}"
}