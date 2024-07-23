module "account" {
  source = "../../../modules/components/aws_organization_account"

  name           = var.account_name
  parent_ou_path = "Root/cicd-testing"
  email_prefix   = var.email_prefix
  email_domain   = var.email_domain
  tags           = var.tags

}