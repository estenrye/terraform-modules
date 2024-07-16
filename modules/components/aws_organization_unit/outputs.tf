output "id" {
  value = aws_organizations_organizational_unit.org_unit.id
}

output "arn" {
  value = aws_organizations_organizational_unit.org_unit.arn
}

output "parent_id" {
  value = lookup(
    local.ou_id_lookup_map,
    length(local.ou_hierarchy),
    data.aws_organizations_organization.org.roots[0].id
  )
}

output "parent_arn" {
  value = lookup(
    local.ou_arn_lookup_map,
    length(local.ou_hierarchy),
    data.aws_organizations_organization.org.roots[0].id
  )
}

output "name" {
  value = aws_organizations_organizational_unit.org_unit.name
}

output "tags_all" {
  value = aws_organizations_organizational_unit.org_unit.tags_all
}