module "state_bucket" {
  count  = var.create_state_bucket ? 1 : 0
  source = "stage.dev.stackgen.com/enterprise/gcs-bucket/gcp"

  name     = var.state_bucket_name
  location = var.region
  purpose  = "terraform-state"
  stage    = "bootstrap"

}