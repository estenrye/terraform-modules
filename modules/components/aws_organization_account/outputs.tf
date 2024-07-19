output "name" {
  value = aws_organizations_account.account.name
}

output "email" {
  value = aws_organizations_account.account.email
}

output "id" {
  value = aws_organizations_account.account.id
}

output "arn" {
  value = aws_organizations_account.account.arn
}

output "govcloud_id" {
  value = aws_organizations_account.account.govcloud_id
}

output "parent_ou_id" {
  value = local.ou_id_lookup_map[length(local.ou_hierarchy)]
}

output "parent_ou_arn" {
  value = local.ou_arn_lookup_map[length(local.ou_hierarchy)]

}