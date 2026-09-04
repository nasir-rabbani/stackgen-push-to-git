variable "billing_account_id" {
  description = "Billing account ID (required when create_project = true)"
  type        = string
  default     = "016622-66B1F3-93359C"

  validation {
    condition     = !var.create_project || var.billing_account_id != ""
    error_message = "billing_account_id is required when create_project = true."
  }
}

variable "create_project" {
  description = "Create the seed GCP project and link billing. Set false if the bootstrap project already exists."
  type        = bool
  default     = true
}

variable "project_id" {
  description = "Bootstrap GCP project ID (immutable once created)"
  type        = string
  default     = "lcs-bootstrap"
}

variable "project_name" {
  description = "Display name for the seed project (when create_project = true)"
  type        = string
  default     = "lcs-bootstrap"
}

variable "organization_id" {
  description = "GCP organization numeric ID. Required when create_project = true."
  type        = string
  default     = "425846541864"
}

variable "locals_bootstrap_apis" {
}

