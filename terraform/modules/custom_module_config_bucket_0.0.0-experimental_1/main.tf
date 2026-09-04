module "config_bucket" {
  source = "stage.dev.stackgen.com/enterprise/gcs-bucket/gcp"

  name     = var.config_bucket_name
  location = var.region
  purpose  = "terraform-config"
  stage    = "bootstrap"

}