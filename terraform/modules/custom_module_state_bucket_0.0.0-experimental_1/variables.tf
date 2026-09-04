variable "state_bucket_name" {
  description = "GCS bucket for all landing zone Terraform remote state (shared with terraform-runner and mdm-dev)"
  type        = string
  default     = "lcs-gcs-tfstate"
}

variable "region" {
  description = "Primary GCP region"
  type        = string
  default     = "asia-south1"
}

variable "create_state_bucket" {
  description = "Create the state bucket in bootstrap. Set false when using the terraform-runner bucket (lcs-gcs-tfstate)."
  type        = bool
  default     = false
}

