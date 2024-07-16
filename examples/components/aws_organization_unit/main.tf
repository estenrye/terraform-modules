terraform {
  required_version = ">= 1.1"
}

// Create a new OU under the root OU
module "ou_a" {
  source = "../../../modules/components/aws_organization_unit"

  name = var.ou_a_name

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_unit"
  }
}

// Specify the name of an OU to use as the parent of a new OU using the Organization root as the Root OU id.
module "ou_b" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a]

  name           = var.ou_b_name
  parent_ou_path = var.ou_b_parent_path

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_unit"
  }
}

data "aws_organizations_organization" "org" {}

// Specify the id of an OU to use as the root of a Parent OU search 
module "ou_c" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a, module.ou_b]

  name           = var.ou_c_name
  parent_ou_path = var.ou_c_parent_path

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_unit"
  }
}

module "ou_d" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a, module.ou_b, module.ou_c]

  name           = var.ou_d_name
  parent_ou_path = var.ou_d_parent_path

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_unit"
  }
}

module "ou_e" {
  source     = "../../../modules/components/aws_organization_unit"
  depends_on = [module.ou_a, module.ou_b, module.ou_c, module.ou_d]

  name           = var.ou_e_name
  parent_ou_path = var.ou_e_parent_path

  tags = {
    "costcenter" = "opex-ops-infra-ci"
    "component"  = "aws_organization_unit"
  }
}
