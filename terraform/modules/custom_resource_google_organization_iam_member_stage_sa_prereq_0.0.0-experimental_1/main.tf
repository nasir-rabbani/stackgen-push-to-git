resource "google_organization_iam_member" "stage_sa_prereq" {
  for_each = var.grant_stage_sa_prereq_iam ? var.locals_stage_sa_prereq_org_bindings : {}

  org_id = var.organization_id
  role   = each.value.role
  member = each.value.member
}