locals {
  stage_upstream_state_prefixes = {
    organization = ["landing-zone/1-bootstrap/tfstate"]
    environments = [
      "landing-zone/1-bootstrap/tfstate",
      "landing-zone/2-organization/tfstate",
    ]
    networks = [
      "landing-zone/1-bootstrap/tfstate",
      "landing-zone/2-organization/tfstate",
    ]
    projects = [
      "landing-zone/1-bootstrap/tfstate",
      "landing-zone/2-organization/tfstate",
      "landing-zone/3-environments/tfstate",
      "landing-zone/4-networks/tfstate",
    ]
    app_infra = [
      "landing-zone/1-bootstrap/tfstate",
      "landing-zone/3-environments/tfstate",
      "landing-zone/4-networks/tfstate",
      "landing-zone/5-projects/tfstate",
    ]
  }
}

locals {
  stage_upstream_state_access = {
    for item in flatten([
      for stage, prefixes in local.stage_upstream_state_prefixes : [
        for prefix in prefixes : {
          key    = "${stage}--${replace(prefix, "/", "-")}"
          stage  = stage
          prefix = prefix
        }
      ]
    ]) : item.key => item
  }
}

locals {
  project_id = var.create_project ? module.module_project.this[0].project_id : var.project_id
}

locals {
  state_bucket_name = var.state_bucket_name
}

locals {
  bootstrap_apis = [
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudkms.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "storage.googleapis.com",
    "sts.googleapis.com",
    "orgpolicy.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "logging.googleapis.com",
    "securitycenter.googleapis.com",
    "secretmanager.googleapis.com",
    "compute.googleapis.com",
    "dns.googleapis.com",
    "artifactregistry.googleapis.com",
    # Quota project for stage applies — needed when impersonating bootstrap SAs
    "pubsub.googleapis.com",
  ]
}

locals {
  bootstrap_sa_roles = [
    "roles/storage.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/serviceusage.serviceUsageAdmin",
  ]
}

locals {
  stage_service_accounts = {
    bootstrap = {
      account_id   = "lcs-sa-bootstrap"
      display_name = "Landing Zone Bootstrap Stage SA"
      state_prefix = "landing-zone/1-bootstrap/tfstate"
    }
    organization = {
      account_id   = "lcs-sa-organization"
      display_name = "Landing Zone Organization Stage SA"
      state_prefix = "landing-zone/2-organization/tfstate"
    }
    environments = {
      account_id   = "lcs-sa-environments"
      display_name = "Landing Zone Environments Stage SA"
      state_prefix = "landing-zone/3-environments/tfstate"
    }
    networks = {
      account_id   = "lcs-sa-networks"
      display_name = "Landing Zone Networks Stage SA"
      state_prefix = "landing-zone/4-networks/tfstate"
    }
    projects = {
      account_id   = "lcs-sa-projects"
      display_name = "Landing Zone Projects Stage SA"
      state_prefix = "landing-zone/5-projects/tfstate"
    }
    app_infra = {
      account_id   = "lcs-sa-app-infra"
      display_name = "Landing Zone App Infra Stage SA"
      state_prefix = "landing-zone/6-app-infra/tfstate"
    }
  }
}

locals {
  stage_sa_prereq_org_roles = {
    organization = [
      "roles/resourcemanager.folderAdmin",
      "roles/resourcemanager.projectCreator",
      "roles/orgpolicy.policyAdmin",
      "roles/logging.admin", # org sinks (logging.configWriter alone can fail at org scope)
      "roles/essentialcontacts.admin",
      "roles/accesscontextmanager.policyAdmin",
    ]
    environments = [
      "roles/resourcemanager.folderAdmin",
      "roles/resourcemanager.projectCreator",
    ]
    networks = [
      "roles/resourcemanager.projectCreator",
      "roles/compute.xpnAdmin", # enable Shared VPC host (compute.organizations.enableXpnHost)
    ]
    projects = [
      "roles/resourcemanager.projectCreator",
    ]
  }
}

locals {
  stage_sa_prereq_billing_stages = toset([
    "organization",
    "environments",
    "networks",
    "projects",
  ])
}

locals {
  stage_sa_prereq_org_bindings = {
    for item in flatten([
      for stage, roles in local.stage_sa_prereq_org_roles : [
        for role in roles : {
          key    = "${stage}--${role}"
          stage  = stage
          role   = role
          member = "serviceAccount:${module.module_stage_service_accounts.this[stage].email}"
        }
      ]
    ]) : item.key => item
  }
}

