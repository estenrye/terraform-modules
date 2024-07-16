output "root_ou_id" {
  value = data.aws_organizations_organization.org.roots[0].id
}

output "ou_a_id" {
  value = module.ou_a.id
}

output "ou_a_arn" {
  value = module.ou_a.arn
}

output "ou_a_parent_id" {
  value = module.ou_a.parent_id
}

output "ou_a_parent_arn" {
  value = module.ou_a.parent_arn
}

output "ou_b_id" {
  value = module.ou_b.id
}

output "ou_b_arn" {
  value = module.ou_b.arn
}

output "ou_b_parent_id" {
  value = module.ou_b.parent_id
}

output "ou_b_parent_arn" {
  value = module.ou_b.parent_arn
}

output "ou_c_id" {
  value = module.ou_c.id
}

output "ou_c_arn" {
  value = module.ou_c.arn
}

output "ou_c_parent_id" {
  value = module.ou_c.parent_id
}

output "ou_c_parent_arn" {
  value = module.ou_c.parent_arn
}

output "ou_d_id" {
  value = module.ou_d.id
}

output "ou_d_arn" {
  value = module.ou_d.arn
}

output "ou_d_parent_id" {
  value = module.ou_d.parent_id
}

output "ou_d_parent_arn" {
  value = module.ou_d.parent_arn
}

output "ou_e_id" {
  value = module.ou_e.id
}

output "ou_e_arn" {
  value = module.ou_e.arn
}

output "ou_e_parent_id" {
  value = module.ou_e.parent_id
}

output "ou_e_parent_arn" {
  value = module.ou_e.parent_arn
}
