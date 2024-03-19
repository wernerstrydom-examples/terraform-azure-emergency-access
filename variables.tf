variable "name" {
  type        = string
  description = "The name of the group"
  default     = "Emergency Access"
}

variable "description" {
  type        = string
  description = "The description of the group"
  default     = "The breaking-the-glass group used when all else fails"
}

variable "members" {
  type    = set(string)
  description = "The list of members in the group"
  default = []
}
