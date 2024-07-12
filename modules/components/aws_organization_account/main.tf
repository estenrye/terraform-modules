data "aws_organizations_organizational_unit" "ou" {
  parent_id = var.parent_ou_id
  name      = var.ou_name
}

resource "aws_organizations_account" "account" {
  name  = var.account_name
  email = "${var.email_prefix}+${var.account_name}@${var.email_domain}"

  parent_id                  = data.aws_organizations_organizational_unit.ou.id
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