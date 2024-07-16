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

resource "aws_organizations_organizational_unit" "org_unit" {
  name = var.name
  parent_id = lookup(
    local.ou_id_lookup_map,
    length(local.ou_hierarchy),
    data.aws_organizations_organization.org.roots[0].id
  )

  tags = local.tags
}