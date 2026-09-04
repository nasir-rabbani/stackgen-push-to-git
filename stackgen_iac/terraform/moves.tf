
################################################################################

moved {
  from = google_project_iam_member.stage_sa_service_usage
  to   = module.resource_google_project_iam_member_stage_sa_service_usage.google_project_iam_member.stage_sa_service_usage
}

moved {
  from = module.project
  to   = module.module_project.module.project
}

moved {
  from = google_organization_iam_member.stage_sa_prereq
  to   = module.resource_google_organization_iam_member_stage_sa_prereq.google_organization_iam_member.stage_sa_prereq
}

moved {
  from = google_billing_account_iam_member.stage_sa_prereq
  to   = module.resource_google_billing_account_iam_member_stage_sa_prereq.google_billing_account_iam_member.stage_sa_prereq
}

moved {
  from = module.project_apis_existing
  to   = module.module_project_apis_existing.module.project_apis_existing
}

moved {
  from = module.state_bucket
  to   = module.module_state_bucket.module.state_bucket
}

moved {
  from = module.config_bucket
  to   = module.module_config_bucket.module.config_bucket
}

moved {
  from = module.stage_service_accounts
  to   = module.module_stage_service_accounts.module.stage_service_accounts
}

moved {
  from = module.stage_state_access
  to   = module.module_stage_state_access.module.stage_state_access
}

moved {
  from = module.stage_upstream_state_read
  to   = module.module_stage_upstream_state_read.module.stage_upstream_state_read
}

moved {
  from = module.stage_config_access
  to   = module.module_stage_config_access.module.stage_config_access
}

moved {
  from = module.wif
  to   = module.module_wif.module.wif
}

