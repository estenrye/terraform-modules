# Terraform Module: aws_organizational_account

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account_name | The name of the account | `string` | n/a | yes |
| ou_name      | The name of the organizational unit to place the account under | `string` | n/a | yes |
| email_prefix | The email prefix to use for the account | `string` | n/a | yes |
| email_domain | The email domain to use for the account | `string` | n/a | yes |
| parent_ou_id | The ID of the parent organizational unit to search for account by `ou_name` | `string` | `null` | no |
| tags         | A map of tags to assign to the account | `map(string)` | `{}` | no |
| close_on_deletion | Whether to close the account when it is deleted | `bool` | `true` | no |
| create_govcloud   | Whether to create the account in AWS GovCloud | `bool` | `false` | no |
| iam_user_access_to_billing | Whether to allow IAM users to access billing information | `bool` | `true` | no |
| role_name | The name of the role to assume when creating the account | `string` | `OrganizationAccountAccessRole` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the account |
| arn | The ARN of the account |
| name | The ARN of the account |
| email | The email address of the account |
| govcloud_id | The ID of the account in AWS GovCloud |

## Related Documentation

### Terraform Resources
- [Data: aws_organizations_organizational_unit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_unit)
- [Resource: aws_organizations_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account)