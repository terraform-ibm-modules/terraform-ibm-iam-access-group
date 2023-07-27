##############################################################################
# Input variables
##############################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "Restricted IBM Cloud API Key used only for writing Log Analysis archives to Cloud Object Storage"
  default     = null
  sensitive   = true
}


variable "prefix" {
  description = "Name of the access group"
  type        = string
  default     = "basic-test"
}

variable "dynamic_rules" {
  description = "list of dynamic rules"
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = optional(list(object({
      claim    = string
      operator = string
      value    = string
    })))
  }))
  default = {
    rule-name = {
      expiration        = 3
      identity_provider = "https://idp-test.example.org/SAML2"
      conditions = [{
        claim    = "blueGroups"
        operator = "CONTAINS"
        value    = "test"
      }]
    }
  }
}

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
  default = {
    "policy_name" = {
      roles = ["Viewer", "Manager"]
      tags  = ["iam-service-policy-example-test"]
    }
  }
}

variable "ibm_ids" {
  description = "A list of IBM IDs that you want to add to the access group."
  type        = list(string)
  default     = ["GoldenEye.Development@ibm.com"]
}



# variable "ibmcloud_api_key" {
#   type        = string
#   description = "The IBM Cloud API Key"
#   sensitive   = true
# }

# variable "region" {
#   type        = string
#   description = "Region to provision all resources created by this example"
#   default     = "us-south"
# }

# variable "prefix" {
#   type        = string
#   description = "Prefix to append to all resources created by this example"
#   default     = "basic"
# }

# variable "resource_group" {
#   type        = string
#   description = "The name of an existing resource group to provision resources in to. If not set a new resource group will be created using the prefix variable"
#   default     = null
# }

# variable "resource_tags" {
#   type        = list(string)
#   description = "Optional list of tags to be added to created resources"
#   default     = []
# }
