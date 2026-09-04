variable "grant_stage_sa_prereq_iam" {
  description = "Grant org-level IAM + billing.user + serviceUsageConsumer on bootstrap to all stage SAs before Stages 2–6. Requires org admin + billing.admin on bootstrap apply identity."
  type        = bool
  default     = true
}

variable "locals_stage_service_accounts" {
}

variable "locals_project_id" {
}

variable "module_stage_service_accounts" {
}

