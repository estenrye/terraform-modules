variable "account_name" {
  description = "The name of the account"
  default     = "account"
  type        = string
}

variable "email_prefix" {
  description = "The email prefix for the organization"
  default     = "prefix"
  type        = string
}

variable "email_domain" {
  description = "The email domain for the organization"
  default     = "example.com"
  type        = string
}