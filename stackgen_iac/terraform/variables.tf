
################################################################################

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

variable "billing_account_id" {
  description = "Billing account ID (required when create_project = true)"
  type        = string
  default     = "016622-66B1F3-93359C"

  validation {
    condition     = !var.create_project || var.billing_account_id != ""
    error_message = "billing_account_id is required when create_project = true."
  }
}

variable "grant_stage_sa_prereq_iam" {
  description = "Grant org-level IAM + billing.user + serviceUsageConsumer on bootstrap to all stage SAs before Stages 2–6. Requires org admin + billing.admin on bootstrap apply identity."
  type        = bool
  default     = true
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

variable "state_bucket_project" {
  description = "GCP project that owns the shared state bucket (created by terraform-runner/)"
  type        = string
  default     = "lcs-meridius-terraform-runner"
}

variable "state_bucket_name" {
  description = "GCS bucket for all landing zone Terraform remote state (shared with terraform-runner and mdm-dev)"
  type        = string
  default     = "lcs-gcs-tfstate"
}

variable "config_bucket_name" {
  description = "GCS bucket for plan artifacts and landing zone configuration exports"
  type        = string
  default     = "lcs-gcs-config"
}

variable "enable_wif" {
  description = "Create Workload Identity Federation pool and provider (requires issuer details)"
  type        = bool
  default     = false
}

variable "wif_pool_id" {
  description = "Workload Identity Federation pool ID"
  type        = string
  default     = "lcs-wif-pool"
}

variable "wif_provider_id" {
  description = "Workload Identity Federation provider ID"
  type        = string
  default     = "lcs-wif-provider"
}

variable "wif_issuer_uri" {
  description = "OIDC issuer URI for the CI/CD system (e.g. Bitbucket workspace issuer)"
  type        = string
  default     = ""
}

variable "wif_allowed_audiences" {
  description = "Allowed audiences for the WIF provider"
  type        = list(string)
  default     = []
}

variable "wif_attribute_mapping" {
  description = "Attribute mapping for the WIF provider"
  type        = map(string)
  default = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }
}

variable "wif_attribute_condition" {
  description = "CEL condition restricting which CI jobs can authenticate"
  type        = string
  default     = ""
}

variable "stage_sa_impersonators" {
  description = "Members allowed to impersonate stage SAs for local Terraform (e.g. user:you@company.com). Required for GOOGLE_IMPERSONATE_SERVICE_ACCOUNT."
  type        = list(string)
  default     = []
}

variable "wif_ci_principal" {
  description = "CI principal allowed to impersonate stage SAs (set after WIF provider exists)"
  type        = string
  default     = ""
}

