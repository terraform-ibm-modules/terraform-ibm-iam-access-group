variable "template_name" {
  description = "Name of the access group template"
  type        = string
}

variable "template_description" {
  description = "Description of the access group template"
  type        = string
  default     = null
}

variable "access_group_name" {
  description = "Name of the access group to be created from the template"
  type        = string
}

variable "access_group_description" {
  description = "Description of the access group to be created from the template"
  type        = string
  default     = null
}

variable "members" {
  description = "Members to be added to the access group"
  type = object({
    users           = optional(list(string), [])
    services        = optional(list(string), [])
    action_controls = optional(object({
      add    = optional(bool, true)
      remove = optional(bool, true)
    }))
  })
  default = null
}

variable "assertions" {
  description = "Dynamic rules for the access group"
  type = list(object({
    rules                      = list(object({
      name = string
      expiration = number
      realm_name = string
      conditions = object({
        claim = string
        operator = string
        value = string
      })
      action_control = optional(object({
        remove = optional(bool, false)
      }))
    }))
    action_controls           = optional(object({
      add    = optional(bool, false)
      remove = optional(bool, false)
    }))
  }))
  default = []
}

variable "policy_templates" {
  description = "List of IAM policy templates to create"
  type = list(object({
    name        = string
    description = string
    roles       = list(string)
    attributes = list(object({
      key      = string
      value    = string
      operator = string
    }))
  }))
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