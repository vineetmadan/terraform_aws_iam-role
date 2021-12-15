variable "role_name" {
  description = "IAM Role Name"
  type        = string
}
variable "assume_role_policy" {
  description = "IAM Role Name"
  type        = string
  default     = ""
}

variable "create_iam_role_policy" {
  description = "Whether to create IAM role policy"
  type        = bool
  default     = true 
}
variable "iam_role_policy_name" {
  description = "IAM role policy name"
  type        = string
}
variable "iam_role_policy" {
  description = "IAM role policy"
  type        = string
  default     = ""
}

variable "create_instance_profile" {
  description = "Whether to create IAM instance profile"
  type        = bool
  default     = true
}
variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile to be created"
  type        = string
  default     = ""
}

variable "policy_list" {
  description = "List of IAM policies to be attached to the IAM role"
  type        = list
  default     = []  
}
variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}


