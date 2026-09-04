module "module_config_bucket" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source             = "./modules/custom_module_config_bucket_0.0.0-experimental_1"
  config_bucket_name = var.config_bucket_name
  region             = var.region
  depends_on         = [module.module_project, module.module_project_apis_existing]
}

module "module_project" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                = "./modules/custom_module_project_0.0.0-experimental_1"
  billing_account_id    = var.billing_account_id
  create_project        = var.create_project
  locals_bootstrap_apis = local.bootstrap_apis
  organization_id       = var.organization_id
  project_id            = var.project_id
  project_name          = var.project_name
}

module "module_project_apis_existing" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                = "./modules/custom_module_project_apis_existing_0.0.0-experimental_1"
  create_project        = var.create_project
  locals_bootstrap_apis = local.bootstrap_apis
  project_id            = var.project_id
}

module "module_stage_config_access" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                        = "./modules/custom_module_stage_config_access_0.0.0-experimental_1"
  locals_stage_service_accounts = local.stage_service_accounts
  module_config_bucket          = module.module_config_bucket.this
  module_stage_service_accounts = module.module_stage_service_accounts.this
}

module "module_stage_service_accounts" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                        = "./modules/custom_module_stage_service_accounts_0.0.0-experimental_1"
  enable_wif                    = var.enable_wif
  locals_bootstrap_sa_roles     = local.bootstrap_sa_roles
  locals_project_id             = local.project_id
  locals_stage_service_accounts = local.stage_service_accounts
  stage_sa_impersonators        = var.stage_sa_impersonators
  wif_ci_principal              = var.wif_ci_principal
  depends_on                    = [module.module_project_apis_existing, module.module_project]
}

module "module_stage_state_access" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                        = "./modules/custom_module_stage_state_access_0.0.0-experimental_1"
  locals_stage_service_accounts = local.stage_service_accounts
  locals_state_bucket_name      = local.state_bucket_name
  module_stage_service_accounts = module.module_stage_service_accounts.this
}

module "module_stage_upstream_state_read" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                             = "./modules/custom_module_stage_upstream_state_read_0.0.0-experimental_1"
  locals_stage_upstream_state_access = local.stage_upstream_state_access
  locals_state_bucket_name           = local.state_bucket_name
  module_stage_service_accounts      = module.module_stage_service_accounts.this
}

module "module_state_bucket" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source              = "./modules/custom_module_state_bucket_0.0.0-experimental_1"
  create_state_bucket = var.create_state_bucket
  region              = var.region
  state_bucket_name   = var.state_bucket_name
  depends_on          = [module.module_project, module.module_project_apis_existing]
}

module "module_wif" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                  = "./modules/custom_module_wif_0.0.0-experimental_1"
  enable_wif              = var.enable_wif
  locals_project_id       = local.project_id
  wif_attribute_condition = var.wif_attribute_condition
  wif_attribute_mapping   = var.wif_attribute_mapping
  wif_issuer_uri          = var.wif_issuer_uri
  wif_pool_id             = var.wif_pool_id
  wif_provider_id         = var.wif_provider_id
  depends_on              = [module.module_project, module.module_project_apis_existing]
}

module "resource_google_billing_account_iam_member_stage_sa_prereq" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                                = "./modules/custom_resource_google_billing_account_iam_member_stage_sa_prereq_0.0.0-experimental_1"
  billing_account_id                    = var.billing_account_id
  grant_stage_sa_prereq_iam             = var.grant_stage_sa_prereq_iam
  locals_stage_sa_prereq_billing_stages = local.stage_sa_prereq_billing_stages
  module_stage_service_accounts         = module.module_stage_service_accounts.this
}

module "resource_google_organization_iam_member_stage_sa_prereq" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                              = "./modules/custom_resource_google_organization_iam_member_stage_sa_prereq_0.0.0-experimental_1"
  grant_stage_sa_prereq_iam           = var.grant_stage_sa_prereq_iam
  locals_stage_sa_prereq_org_bindings = local.stage_sa_prereq_org_bindings
  organization_id                     = var.organization_id
}

module "resource_google_project_iam_member_stage_sa_service_usage" {
  # This module is locally scoped to this appStack hence vendored within the project. 
  # To share this across other appStacks, promote it to the Project/Tenant-level Catalog.
  source                        = "./modules/custom_resource_google_project_iam_member_stage_sa_service_usage_0.0.0-experimental_1"
  grant_stage_sa_prereq_iam     = var.grant_stage_sa_prereq_iam
  locals_project_id             = local.project_id
  locals_stage_service_accounts = local.stage_service_accounts
  module_stage_service_accounts = module.module_stage_service_accounts.this
}

