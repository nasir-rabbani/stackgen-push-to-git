variable "grant_stage_sa_prereq_iam" {
  description = "Grant org-level IAM + billing.user + serviceUsageConsumer on bootstrap to all stage SAs before Stages 2–6. Requires org admin + billing.admin on bootstrap apply identity."
  type        = bool
  default     = true
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

variable "locals_stage_sa_prereq_billing_stages" {
}

variable "module_stage_service_accounts" {
}

