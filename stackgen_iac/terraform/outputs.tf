
################################################################################

output "project_id" {
  description = "Bootstrap seed project ID"
  value       = local.project_id
}

output "project_number" {
  description = "Bootstrap seed project number (when create_project = true)"
  value       = var.create_project ? module.module_project.this[0].number : null
}

output "state_bucket_project" {
  description = "GCP project that owns the shared state bucket"
  value       = var.state_bucket_project
}

output "state_bucket_name" {
  description = "Shared GCS bucket for all landing zone Terraform state"
  value       = local.state_bucket_name
}

output "state_bucket_url" {
  description = "GCS URL for the state bucket"
  value       = "gs://${local.state_bucket_name}"
}

output "config_bucket_name" {
  description = "GCS bucket for plan artifacts and configuration exports"
  value       = module.module_config_bucket.this.name
}

output "stage_service_accounts" {
  description = "Email addresses for each landing zone stage service account"
  value = {
    for stage, sa in module.module_stage_service_accounts.this : stage => sa.email
  }
}

output "stage_state_prefixes" {
  description = "GCS state prefix per landing zone stage"
  value = {
    for stage, cfg in local.stage_service_accounts : stage => cfg.state_prefix
  }
}

output "wif_pool_name" {
  description = "Full WIF pool resource name (empty if WIF disabled)"
  value       = module.module_wif.this.pool_name
}

output "wif_provider_name" {
  description = "Full WIF provider resource name (empty if WIF disabled)"
  value       = module.module_wif.this.provider_name
}

output "migrate_state_command" {
  description = "Run after first apply to move bootstrap state into GCS"
  value       = <<-EOT
    # Add this backend block to versions.tf, then run:
    #
    # backend "gcs" {
    #   bucket = "${local.state_bucket_name}"
    #   prefix = "${local.stage_service_accounts.bootstrap.state_prefix}"
    # }
    #
    # terraform init -migrate-state
  EOT
}

output "next_stage" {
  description = "Next landing zone stage to implement"
  value       = "landing-zone/2-organization"
}

