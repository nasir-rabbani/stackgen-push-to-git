resource "google_project_iam_member" "stage_sa_service_usage" {
  for_each = var.grant_stage_sa_prereq_iam ? var.locals_stage_service_accounts : {}

  project = var.locals_project_id
  role    = "roles/serviceusage.serviceUsageConsumer"
  member  = "serviceAccount:${var.module_stage_service_accounts[each.key].email}"
}