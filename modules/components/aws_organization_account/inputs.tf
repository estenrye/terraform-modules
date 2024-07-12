variable "ou_name" {
  type        = string
  description = "The name of the organizational unit to place the account in"
}

variable "account_name" {
  type        = string
  description = "The name of the account"
}

variable "parent_ou_id" {
  type        = string
  description = "The id of the parent organizational unit to search for the organizational unit"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the account"
  default     = {}
}

variable "email_prefix" {
  type        = string
  description = "The email prefix for the organization"
}

variable "email_domain" {
  type        = string
  description = "The email domain for the organization"
}

variable "close_on_deletion" {
  type        = bool
  description = "Close the account on deletion"
  default     = true
}

variable "create_govcloud" {
  type        = bool
  description = "Create a GovCloud account"
  default     = false
}

variable "iam_user_access_to_billing" {
  type        = bool
  description = "The IAM account access to billing for the organization"
  default     = true
}

variable "role_name" {
  type        = string
  description = "The role name for the organization"
  default     = "OrganizationAccountAccessRole"
}