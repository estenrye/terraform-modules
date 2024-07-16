variable "ou_a_name" {
  type        = string
  description = "The name of the organizational unit to create under the root organizational unit"
  default     = "ou_a"
}

variable "ou_b_name" {
  type        = string
  description = "The name of the organizational unit to create under the root sub organizational unit"
  default     = "ou_b"
}

variable "ou_b_parent_path" {
  type        = string
  description = "The path of the parent organizational unit to place the organizational unit"
  default     = "Root/ou_a"
}

variable "ou_c_name" {
  type        = string
  description = "The name of the organizational unit to create under the alternate root sub organizational unit"
  default     = "ou_c"
}

variable "ou_c_parent_path" {
  type        = string
  description = "The path of the parent organizational unit to place the organizational unit"
  default     = "Root/ou_a/ou_b"
}

variable "ou_d_name" {
  type        = string
  description = "The name of the organizational unit to create under the alternate root sub organizational unit"
  default     = "ou_d"
}

variable "ou_d_parent_path" {
  type        = string
  description = "The path of the parent organizational unit to place the organizational unit"
  default     = "Root/ou_a/ou_b/ou_c"
}

variable "ou_e_name" {
  type        = string
  description = "The name of the organizational unit to create under the alternate root sub organizational unit"
  default     = "ou_e"
}

variable "ou_e_parent_path" {
  type        = string
  description = "The path of the parent organizational unit to place the organizational unit"
  default     = "Root/ou_a/ou_b/ou_c/ou_d"
}