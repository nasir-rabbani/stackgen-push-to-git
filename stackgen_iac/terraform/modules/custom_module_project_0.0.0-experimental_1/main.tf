module "project" {
  count  = var.create_project ? 1 : 0
  source = "stage.dev.stackgen.com/enterprise/project/gcp"

  project_id          = var.project_id
  name                = var.project_name
  org_id              = var.organization_id
  billing_account     = var.billing_account_id
  apis                = var.locals_bootstrap_apis
  auto_create_network = false
  deletion_policy     = "PREVENT"

  labels = {
    managed-by = "terraform"
    purpose    = "landing-zone-bootstrap"
  }
}