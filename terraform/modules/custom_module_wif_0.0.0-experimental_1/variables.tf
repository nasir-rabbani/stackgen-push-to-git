variable "enable_wif" {
  description = "Create Workload Identity Federation pool and provider (requires issuer details)"
  type        = bool
  default     = false
}

variable "wif_issuer_uri" {
  description = "OIDC issuer URI for the CI/CD system (e.g. Bitbucket workspace issuer)"
  type        = string
  default     = ""
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

variable "locals_project_id" {
}

