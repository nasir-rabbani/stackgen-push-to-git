variable "stage_sa_impersonators" {
  description = "Members allowed to impersonate stage SAs for local Terraform (e.g. user:you@company.com). Required for GOOGLE_IMPERSONATE_SERVICE_ACCOUNT."
  type        = list(string)
  default     = []
}

variable "enable_wif" {
  description = "Create Workload Identity Federation pool and provider (requires issuer details)"
  type        = bool
  default     = false
}

variable "wif_ci_principal" {
  description = "CI principal allowed to impersonate stage SAs (set after WIF provider exists)"
  type        = string
  default     = ""
}

variable "locals_stage_service_accounts" {
}

variable "locals_bootstrap_sa_roles" {
}

variable "locals_project_id" {
}

