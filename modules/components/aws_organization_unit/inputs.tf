variable "parent_ou_path" {
  type        = string
  description = "The path of the parent organizational unit to place the organizational unit"
  default     = "Root"

  validation {
    condition     = length(split("/", var.parent_ou_path)) <= 5 && substr(var.parent_ou_path, 0, 4) == "Root"
    error_message = "Parent OU Path cannot have a hierarchy depth greater than 5, starting with \"Root/\"."
  }
}

variable "name" {
  type        = string
  description = "The name of the organizational unit to create"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the organizational unit"
  default     = {}
}