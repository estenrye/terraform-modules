variable "name" {
  type        = string
  description = "The name of the account"
}

variable "parent_ou_path" {
  type        = string
  description = "The path of the parent organizational unit to place the organizational unit"
  default     = "Root"

  validation {
    condition     = length(split("/", var.parent_ou_path)) <= 6 && substr(var.parent_ou_path, 0, 4) == "Root"
    error_message = "Parent OU Path cannot have a hierarchy depth greater than 6, starting with \"Root/\"."
  }
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