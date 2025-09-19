variable "ibmcloud_api_key" {
  description = "The IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "prefix" {
  description = "Prefix for naming resources"
  type        = string
  default     = "ag-template-example"
}

variable "user_ids" {
  description = "List of user IDs to add to the access group"
  type        = list(string)
  default     = []
}

variable "service_ids" {
  description = "List of service IDs to add to the access group"
  type        = list(string)
  default     = []
}

variable "account_group_ids_to_assign" {
  type        = list(string)
  default     = ["all"]
  description = "A list of account group IDs to assign the template to. Support passing the string 'all' in the list to assign to all account groups."
  nullable    = false

  validation {
    condition     = contains(var.account_group_ids_to_assign, "all") ? length(var.account_group_ids_to_assign) == 1 : true
    error_message = "When specifying 'all' in the list, you cannot add any other values to the list"
  }
}

variable "account_ids_to_assign" {
  type        = list(string)
  default     = []
  description = "A list of account IDs to assign the template to. Support passing the string 'all' in the list to assign to all accounts."
  nullable    = false

  validation {
    condition     = contains(var.account_ids_to_assign, "all") ? length(var.account_ids_to_assign) == 1 : true
    error_message = "When specifying 'all' in the list, you cannot add any other values to the list"
  }
}
