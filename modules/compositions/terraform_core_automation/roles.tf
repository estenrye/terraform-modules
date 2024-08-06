

# resource "aws_iam_role" "terraform_core_automation_master_account_iam_role" {
#   name               = "terraform-core-automation"
#   assume_role_policy = data.aws_iam_policy_document.github_actions_iam_assume_role_policy.json

#   tags = {
#     Name    = "terraform-core-automation"
#     costcenter = "opex-ops-core-services"
#     component  = "terraform-core-automation"
#   }
# }

# resource "aws_iam_role_policy_attachment" "grant_awsorganizationsfullaccess" {
#   role       = aws_iam_role.terraform_core_automation_master_account_iam_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AWSOrganizationsFullAccess"
# }