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

variable "locals_bootstrap_apis" {
}

