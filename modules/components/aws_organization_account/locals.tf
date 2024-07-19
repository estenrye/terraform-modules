locals {
  tags = merge(var.tags, {
    OU   = var.parent_ou_path,
    Name = var.name
  })

  ou_hierarchy = (
    var.parent_ou_path == null ?
    [] :
    split("/", var.parent_ou_path)
  )

  ou_id_lookup_map = {
    "1" = data.aws_organizations_organization.org.roots[0].id,
    "2" = (length(local.ou_hierarchy) > 1 ? data.aws_organizations_organizational_unit.ou_1[0].id : null),
    "3" = (length(local.ou_hierarchy) > 2 ? data.aws_organizations_organizational_unit.ou_2[0].id : null),
    "4" = (length(local.ou_hierarchy) > 3 ? data.aws_organizations_organizational_unit.ou_3[0].id : null)
    "5" = (length(local.ou_hierarchy) > 4 ? data.aws_organizations_organizational_unit.ou_4[0].id : null)
    "6" = (length(local.ou_hierarchy) > 5 ? data.aws_organizations_organizational_unit.ou_5[0].id : null)
  }

  ou_arn_lookup_map = {
    "1" = data.aws_organizations_organization.org.roots[0].arn,
    "2" = (length(local.ou_hierarchy) > 1 ? data.aws_organizations_organizational_unit.ou_1[0].arn : null),
    "3" = (length(local.ou_hierarchy) > 2 ? data.aws_organizations_organizational_unit.ou_2[0].arn : null),
    "4" = (length(local.ou_hierarchy) > 3 ? data.aws_organizations_organizational_unit.ou_3[0].arn : null)
    "5" = (length(local.ou_hierarchy) > 4 ? data.aws_organizations_organizational_unit.ou_4[0].arn : null)
    "6" = (length(local.ou_hierarchy) > 5 ? data.aws_organizations_organizational_unit.ou_5[0].arn : null)
  }
}