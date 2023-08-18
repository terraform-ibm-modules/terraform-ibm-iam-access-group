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
        claim    = "my_claim"
        operator = "CONTAINS"
        value    = "my_test_value"
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
