##############################################################################
# Input Variables
##############################################################################

##############################################################################
# access group
##############################################################################

variable "access_group_name" {
  description = "Name of the access group"
  type        = string
}

variable "provision" {
  type        = bool
  description = "Would you like to provision a new access group (true/false)"
  default     = true
}

variable "add_members" {
  type        = bool
  description = "Enable this to add members to access group"
  default     = true
}

variable "description" {
  description = "Description to access group"
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = []
}

##############################################################################
# access group members
##############################################################################

variable "ibm_ids" {
  description = "A list of IBM IDs that you want to add to the access group."
  type        = list(string)
  default     = []
}

variable "service_ids" {
  type        = list(string)
  description = "A list of service IDS that you want to add to the access group."
  default     = []
}

variable "trusted_profile_ids" {
  type        = list(string)
  description = "A list of trusted profile IDS that you want to add to the access group."
  default     = []
}

##############################################################################
# access group policy
##############################################################################

variable "policies" {
  description = "list of policies"
  type = map(object({
    roles              = list(string)
    account_management = optional(bool)
    tags               = set(string)
    resources = optional(list(object({
      region               = optional(string)
      attributes           = optional(map(string))
      service              = optional(string)
      resource_instance_id = optional(string)
      resource_type        = optional(string)
      resource             = optional(string)
      resource_group_id    = optional(string)
    })))
    resource_attributes = optional(list(object({
      name     = string
      value    = string
      operator = optional(string)
    })))
  }))
}

##############################################################################
# access group rule
##############################################################################

variable "dynamic_rules" {
  description = "list of dynamic rules"
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  # default = {
  #   name = {
  #       expiration = number
  #       identity_provider = string
  #   }
  # }
}
