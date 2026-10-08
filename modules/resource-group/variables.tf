variable "name" {
  type        = string
  description = "Resource group name"

  validation {
    condition     = length(var.name) > 0
    error_message = "Resource group name cannot be empty."
  }
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {
  type        = map(string)
  default     = {}
}