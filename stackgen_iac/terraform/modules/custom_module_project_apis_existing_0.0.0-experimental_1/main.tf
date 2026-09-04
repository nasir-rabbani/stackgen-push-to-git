module "project_apis_existing" {
  count  = var.create_project ? 0 : 1
  source = "stage.dev.stackgen.com/enterprise/project-apis/gcp"

  project_id = var.project_id
  apis       = var.locals_bootstrap_apis
}