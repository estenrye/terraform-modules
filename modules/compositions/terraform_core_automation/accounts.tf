module "ou_core_services" {
  source = "../../components/aws_organization_unit"

  name = "core-services"

  tags = {
    "costcenter" = "opex-ops-core-services"
  }
}

module "account_identity_services" {
  source     = "../../components/aws_organization_account"
  depends_on = [module.ou_core_services]

  name           = "ops-opex-identity-services"
  parent_ou_path = "Root/core-services"
  email_prefix   = var.email_prefix
  email_domain   = var.email_domain
  tags = {
    "costcenter" = "opex-ops-core-services"
    "component"  = "identity-services"
  }
}

module "account_terraform_core_automation" {
  source     = "../../components/aws_organization_account"
  depends_on = [module.ou_core_services]

  name           = "ops-opex-terraform-core-automation"
  parent_ou_path = "Root/core-services"
  email_prefix   = var.email_prefix
  email_domain   = var.email_domain
  tags = {
    "costcenter" = "opex-ops-core-services"
    "component"  = "terraform-core-automation"
  }
}