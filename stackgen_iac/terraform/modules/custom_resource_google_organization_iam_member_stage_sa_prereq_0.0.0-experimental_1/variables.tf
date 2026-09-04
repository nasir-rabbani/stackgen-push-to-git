variable "grant_stage_sa_prereq_iam" {
  description = "Grant org-level IAM + billing.user + serviceUsageConsumer on bootstrap to all stage SAs before Stages 2–6. Requires org admin + billing.admin on bootstrap apply identity."
  type        = bool
  default     = true
}

variable "organization_id" {
  description = "GCP organization numeric ID. Required when create_project = true."
  type        = string
  default     = "425846541864"
}

variable "locals_stage_sa_prereq_org_bindings" {
}

