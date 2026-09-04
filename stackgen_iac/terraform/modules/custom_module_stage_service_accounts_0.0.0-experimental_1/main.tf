module "stage_service_accounts" {
  source   = "stage.dev.stackgen.com/enterprise/service-account/gcp"
  for_each = var.locals_stage_service_accounts

  project_id   = var.locals_project_id
  account_id   = each.value.account_id
  display_name = each.value.display_name

  project_iam_roles = each.key == "bootstrap" ? var.locals_bootstrap_sa_roles : []

  token_creators = concat(
    var.stage_sa_impersonators,
    var.enable_wif && var.wif_ci_principal != "" ? [var.wif_ci_principal] : [],
  )

}