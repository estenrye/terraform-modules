data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_unit" "ou_1" {
  count     = length(local.ou_hierarchy) > 1 ? 1 : 0
  parent_id = data.aws_organizations_organization.org.roots[0].id
  name      = element(local.ou_hierarchy, 1)
}

data "aws_organizations_organizational_unit" "ou_2" {
  count     = length(local.ou_hierarchy) > 2 ? 1 : 0
  parent_id = data.aws_organizations_organizational_unit.ou_1[0].id
  name      = element(local.ou_hierarchy, 2)
}

data "aws_organizations_organizational_unit" "ou_3" {
  count     = length(local.ou_hierarchy) > 3 ? 1 : 0
  parent_id = data.aws_organizations_organizational_unit.ou_2[0].id
  name      = element(local.ou_hierarchy, 3)
}

data "aws_organizations_organizational_unit" "ou_4" {
  count     = length(local.ou_hierarchy) > 4 ? 1 : 0
  parent_id = data.aws_organizations_organizational_unit.ou_3[0].id
  name      = element(local.ou_hierarchy, 4)
}

data "aws_organizations_organizational_unit" "ou_5" {
  count     = length(local.ou_hierarchy) > 5 ? 1 : 0
  parent_id = data.aws_organizations_organizational_unit.ou_4[0].id
  name      = element(local.ou_hierarchy, 5)
}

resource "aws_organizations_account" "account" {
  name  = var.name
  email = "${var.email_prefix}+${var.name}@${var.email_domain}"

  parent_id = lookup(
    local.ou_id_lookup_map,
    length(local.ou_hierarchy),
    data.aws_organizations_organization.org.roots[0].id
  )

  close_on_deletion          = var.close_on_deletion
  create_govcloud            = var.create_govcloud
  iam_user_access_to_billing = var.iam_user_access_to_billing ? "ALLOW" : "DENY"
  role_name                  = var.role_name

  tags = local.tags

  lifecycle {
    ignore_changes = [
      role_name,
    ]
  }
}