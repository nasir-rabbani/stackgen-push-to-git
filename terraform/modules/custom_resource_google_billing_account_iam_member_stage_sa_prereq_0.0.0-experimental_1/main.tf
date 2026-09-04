resource "google_billing_account_iam_member" "stage_sa_prereq" {
  for_each = var.grant_stage_sa_prereq_iam ? var.locals_stage_sa_prereq_billing_stages : toset([])

  billing_account_id = var.billing_account_id
  role               = "roles/billing.user"
  member             = "serviceAccount:${var.module_stage_service_accounts[each.key].email}"
}