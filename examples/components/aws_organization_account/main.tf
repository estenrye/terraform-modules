module "ou_a" {
  source = "../../../modules/components/aws_organization_unit"

  name = var.account_name

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_account"
  }
}

module "ou_b" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a]

  name           = "ou_b"
  parent_ou_path = format("Root/%s", var.account_name)

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_account"
  }
}

module "ou_c" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a, module.ou_b]

  name           = "ou_c"
  parent_ou_path = format("Root/%s/ou_b", var.account_name)

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_account"
  }
}

module "ou_d" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a, module.ou_b, module.ou_c]

  name           = "ou_d"
  parent_ou_path = format("Root/%s/ou_b/ou_c", var.account_name)

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_account"
  }
}

module "ou_e" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a, module.ou_b, module.ou_c, module.ou_d]

  name           = "ou_e"
  parent_ou_path = format("Root/%s/ou_b/ou_c/ou_d", var.account_name)

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_account"
  }
}

module "account" {
  source = "../../../modules/components/aws_organization_account"

  name           = var.account_name
  parent_ou_path = format("Root/%s/ou_b/ou_c/ou_d/ou_e", var.account_name)
  email_prefix   = var.email_prefix
  email_domain   = var.email_domain
  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_account"
  }

}