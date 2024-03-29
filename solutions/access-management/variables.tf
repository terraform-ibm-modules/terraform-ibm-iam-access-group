variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

##############################################################################
# Admin Observability Variables
##############################################################################

variable "admin_observability_ag_name" {
  type        = string
  description = "Name of the Administrator Observability access group"
  default     = "admin-observability-group"
}

variable "admin_observability_ag_policies" {
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
  description = "A map of policies for the Administrator Observability access group, has a set of default policies that can be overridden"
  default = {
    "atracker" = {
      roles = ["Administrator", "Writer"]
      resources = [{
        service = "atracker"
      }]
      tags = []
    }
    "observability" = {
      roles = ["Administrator", "Manager"]
      resources = [{
        service = "sysdig-monitor"
      }]
      tags = []
    }
    "logdna" = {
      roles = ["Administrator", "Manager"]
      resources = [{
        service = "logdna"
      }]
      tags = []
    }
  }
}

variable "admin_observability_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the admin observability access group"
  default     = {}
}

variable "admin_observability_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin observability group"
  default     = false
}

variable "admin_observability_ag_description" {
  type        = string
  description = "Description of the admin observability access group"
  default     = null
}

variable "admin_observability_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = []
}

variable "admin_observability_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs that you want to add to the admin observability access group"
  default     = []
}

variable "admin_observability_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs that you want to add to the admin observability access group"
  default     = []
}

##############################################################################
# Admin Security Services Variables
##############################################################################

variable "admin_security_ag_name" {
  type        = string
  description = "Name of the Administrator Security access group"
  default     = "admin-security-group"
}

variable "admin_security_ag_policies" {
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
  description = "A map of policies for the Administrator Security access group, has a set of default policies that can be overridden"
  default = {
    "hs-crypto" = {
      roles = ["Administrator", "Manager", "Certificate Manager", "Vault Administrator", "Key Custodian - Creator", "Key Custodian - Deployer", "KMS Key Purge Role"]
      resources = [{
        service = "hs-crypto"
      }]
      tags = []
    }
    "kms" = {
      roles = ["Manager"]
      resources = [{
        service = "kms"
      }]
      tags = []
    }
    "compliance" = {
      roles = ["Administrator", "Manager"]
      resources = [{
        service = "compliance"
      }]
      tags = []
    }
    "secrets-manager" = {
      roles = ["Administrator", "Manager"]
      resources = [{
        service = "secrets-manager"
      }]
      tags = []
    }
  }
}

variable "admin_security_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the admin security access group"
  default     = {}
}

variable "admin_security_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin security group"
  default     = false
}

variable "admin_security_ag_description" {
  type        = string
  description = "Description of the admin security access group"
  default     = null
}

variable "admin_security_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "admin_security_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the admin security access group"
  default     = null
}

variable "admin_security_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the admin security access group"
  default     = null
}

##############################################################################
# Admin Network Services Variables
##############################################################################

variable "admin_network_ag_name" {
  type        = string
  description = "Name of the Administrator Observability access group"
  default     = "admin-network-group"
}

variable "admin_network_ag_policies" {
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
  description = "A map of policies for the Administrator Network access group, has a set of default policies that can be overridden"
  default = {
    "endpoint-gateway" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.endpoint-gateway"
      }]
      tags = []
    }
    "floating-ip" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.floating-ip"
      }]
      tags = []
    }
    "load-balancer" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.load-balancer"
      }]
      tags = []
    }
    "network-acl" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.network-acl"
      }]
      tags = []
    }
    "public-gateway" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.public-gateway"
      }]
      tags = []
    }
    "subnet" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.subnet"
      }]
      tags = []
    }
    "virtual-network-interface" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.virtual-network-interface"
      }]
      tags = []
    }
    "vpn" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.vpn"
      }]
      tags = []
    }
    "vpn-server" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.vpn-server"
      }]
      tags = []
    }
    "vpc" = {
      roles = ["Administrator"]
      resources = [{
        service = "is.vpc"
      }]
      tags = []
    }
    "context-based-restrictions" = {
      roles = ["Administrator"]
      resources = [{
        service = "context-based-restrictions"
      }]
      tags = []
    }
    "context-based-restrictions.zone" = {
      roles = ["Administrator"]
      resources = [{
        service = "context-based-restrictions.zone"
      }]
      tags = []
    }
  }
}

variable "admin_network_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the admin network access group"
  default     = {}
}

variable "admin_network_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin network group"
  default     = false
}

variable "admin_network_ag_description" {
  type        = string
  description = "Description of the admin network access group"
  default     = null
}

variable "admin_network_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "admin_network_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the admin network access group"
  default     = null
}

variable "admin_network_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the admin network access group"
  default     = null
}

##############################################################################
# Admin Compute Services Variables
##############################################################################

variable "admin_compute_ag_name" {
  type        = string
  description = "Name of the Administrator Compute access group"
  default     = "admin-compute-group"
}

variable "admin_compute_ag_policies" {
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
  description = "A map of policies for the Administrator Compute access group, has a set of default policies that can be overridden"
  default = {
    "codeengine" = {
      roles = ["Administrator", "Manager"]
      resources = [{
        services = "codeengine"
      }]
      tags = []
    }
    "containers-kubernetes" = {
      roles = ["Administrator", "Manager"]
      resources = [{
        services = "containers-kubernetes"
      }]
      tags = []
    }
    "is.instance" = {
      roles = ["Administrator"]
      resources = [{
        services = "is.instance"
      }]
      tags = []
    }
    "is.instance-group" = {
      roles = ["Administrator"]
      resources = [{
        services = "is.instance-group"
      }]
      tags = []
    }
    "is.key" = {
      roles = ["Administrator"]
      resources = [{
        services = "is.key"
      }]
      tags = []
    }
    "is.bare-metal-server" = {
      roles = ["Administrator"]
      resources = [{
        services = "is.bare-metal-server"
      }]
      tags = []
    }
    "is.dedicated-host" = {
      roles = ["Administrator"]
      resources = [{
        services = "is.dedicated-host"
      }]
      tags = []
    }
    "is.image" = {
      roles = ["Administrator", "Manager"]
      resources = [{
        services = "is.image"
      }]
      tags = []
    }
    "is.reservation" = {
      roles = ["Administrator"]
      resources = [{
        services = "is.reservation"
      }]
      tags = []
    }
  }
}

variable "admin_compute_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the admin compute access group"
  default     = {}
}

variable "admin_compute_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin compute group"
  default     = false
}

variable "admin_compute_ag_description" {
  type        = string
  description = "Description of the admin compute access group"
  default     = null
}

variable "admin_compute_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "admin_compute_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the admin compute access group"
  default     = null
}

variable "admin_compute_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the admin compute access group"
  default     = null
}

##############################################################################
# Privileged Observability Services Variables
##############################################################################

variable "privileged_observability_ag_name" {
  type        = string
  description = "Name of the Privileged Observability access group"
  default     = "privileged-observability-group"
}

variable "privileged_observability_ag_policies" {
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
  description = "A map of policies for the Privileged Observability access group, has a set of default policies that can be overridden"
  default = {
    "atracker" = {
      roles = ["Editor", "Writer"]
      resources = [{
        service = "atracker"
      }]
      tags = []
    }
    "observability" = {
      roles = ["Editor", "Writer"]
      resources = [{
        service = "sysdig-monitor"
      }]
      tags = []
    }
    "logdna" = {
      roles = ["Editor", "Writer"]
      resources = [{
        service = "logdna"
      }]
      tags = []
    }
  }
}

variable "privileged_observability_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the privileged observability access group"
  default     = {}
}

variable "privileged_observability_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged observability group"
  default     = false
}

variable "privileged_observability_ag_description" {
  type        = string
  description = "Description of the privileged observability access group"
  default     = null
}

variable "privileged_observability_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "privileged_observability_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged observability access group"
  default     = null
}

variable "privileged_observability_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged observability access group"
  default     = null
}

##############################################################################
# Privileged Security Services Variables
##############################################################################

variable "privileged_security_ag_name" {
  type        = string
  description = "Name of the Privileged Security access group"
  default     = "privileged-security-group"
}

variable "privileged_security_ag_policies" {
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
  description = "A map of policies for the Privileged Security access group, has a set of default policies that can be overridden"
  default = {
    "hs-crypto" = {
      roles = ["Editor", "Writer"]
      resources = [{
        service = "hs-crypto"
      }]
      tags = []
    }
    "kms" = {
      roles = ["Writer"]
      resources = [{
        service = "kms"
      }]
      tags = []
    }
    "compliance" = {
      roles = ["Editor", "Writer"]
      resources = [{
        service = "compliance"
      }]
      tags = []
    }
    "secrets-manager" = {
      roles = ["Editor", "Writer"]
      resources = [{
        service = "secrets-manager"
      }]
      tags = []
    }
  }
}

variable "privileged_security_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the privileged security access group"
  default     = {}
}

variable "privileged_security_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged security group"
  default     = false
}

variable "privileged_security_ag_description" {
  type        = string
  description = "Description of the privileged security access group"
  default     = null
}

variable "privileged_security_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "privileged_security_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged security access group"
  default     = null
}

variable "privileged_security_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged security access group"
  default     = null
}

##############################################################################
# Privileged Network Services Variables
##############################################################################

variable "privileged_network_ag_name" {
  type        = string
  description = "Name of the Privileged Observability access group"
  default     = "privileged-network-group"
}

variable "privileged_network_ag_policies" {
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
  description = "A map of policies for the Privileged Network access group, has a set of default policies that can be overridden"
  default = {
    "endpoint-gateway" = {
      roles = ["Editor"]
      resources = [{
        service = "is.endpoint-gateway"
      }]
      tags = []
    }
    "floating-ip" = {
      roles = ["Editor"]
      resources = [{
        service = "is.floating-ip"
      }]
      tags = []
    }
    "load-balancer" = {
      roles = ["Editor"]
      resources = [{
        service = "is.load-balancer"
      }]
      tags = []
    }
    "network-acl" = {
      roles = ["Editor"]
      resources = [{
        service = "is.network-acl"
      }]
      tags = []
    }
    "public-gateway" = {
      roles = ["Editor"]
      resources = [{
        service = "is.public-gateway"
      }]
      tags = []
    }
    "subnet" = {
      roles = ["Editor"]
      resources = [{
        service = "is.subnet"
      }]
      tags = []
    }
    "virtual-network-interface" = {
      roles = ["Editor"]
      resources = [{
        service = "is.virtual-network-interface"
      }]
      tags = []
    }
    "vpn" = {
      roles = ["Editor"]
      resources = [{
        service = "is.vpn"
      }]
      tags = []
    }
    "vpn-server" = {
      roles = ["Editor"]
      resources = [{
        service = "is.vpn-server"
      }]
      tags = []
    }
    "vpc" = {
      roles = ["Editor"]
      resources = [{
        service = "is.vpc"
      }]
      tags = []
    }
    "context-based-restrictions" = {
      roles = ["Editor"]
      resources = [{
        service = "context-based-restrictions"
      }]
      tags = []
    }
    "context-based-restrictions.zone" = {
      roles = ["Editor"]
      resources = [{
        service = "context-based-restrictions.zone"
      }]
      tags = []
    }
  }
}

variable "privileged_network_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the privileged network access group"
  default     = {}
}

variable "privileged_network_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged network group"
  default     = false
}

variable "privileged_network_ag_description" {
  type        = string
  description = "Description of the privileged network access group"
  default     = null
}

variable "privileged_network_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "privileged_network_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged network access group"
  default     = null
}

variable "privileged_network_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged network access group"
  default     = null
}

##############################################################################
# Privileged Compute Services Variables
##############################################################################

variable "privileged_compute_ag_name" {
  type        = string
  description = "Name of the Privileged Compute access group"
  default     = "privileged-compute-group"
}

variable "privileged_compute_ag_policies" {
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
  description = "A map of policies for the Privileged Compute access group, has a set of default policies that can be overridden"
  default = {
    "codeengine" = {
      roles = ["Editor", "Writer"]
      resources = [{
        services = "codeengine"
      }]
      tags = []
    }
    "containers-kubernetes" = {
      roles = ["Editor", "Writer"]
      resources = [{
        services = "containers-kubernetes"
      }]
      tags = []
    }
    "is.instance" = {
      roles = ["Editor"]
      resources = [{
        services = "is.instance"
      }]
      tags = []
    }
    "is.instance-group" = {
      roles = ["Editor"]
      resources = [{
        services = "is.instance-group"
      }]
      tags = []
    }
    "is.key" = {
      roles = ["Editor"]
      resources = [{
        services = "is.key"
      }]
      tags = []
    }
    "is.bare-metal-server" = {
      roles = ["Editor"]
      resources = [{
        services = "is.bare-metal-server"
      }]
      tags = []
    }
    "is.dedicated-host" = {
      roles = ["Editor"]
      resources = [{
        services = "is.dedicated-host"
      }]
      tags = []
    }
    "is.image" = {
      roles = ["Editor", "Writer"]
      resources = [{
        services = "is.image"
      }]
      tags = []
    }
    "is.reservation" = {
      roles = ["Editor"]
      resources = [{
        services = "is.reservation"
      }]
      tags = []
    }
  }
}

variable "privileged_compute_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the privileged compute access group"
  default     = {}
}

variable "privileged_compute_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged compute group"
  default     = false
}

variable "privileged_compute_ag_description" {
  type        = string
  description = "Description of the privileged compute access group"
  default     = null
}

variable "privileged_compute_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "privileged_compute_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged compute access group"
  default     = null
}

variable "privileged_compute_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged compute access group"
  default     = null
}

##############################################################################
# Observer Observability Services Variables
##############################################################################

variable "observer_observability_ag_name" {
  type        = string
  description = "Name of the Observer Observability access group"
  default     = "observer-observability-group"
}

variable "observer_observability_ag_policies" {
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
  description = "A map of policies for the Observer Observability access group, has a set of default policies that can be overridden"
  default = {
    "atracker" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        service = "atracker"
      }]
      tags = []
    }
    "observability" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        service = "sysdig-monitor"
      }]
      tags = []
    }
    "logdna" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        service = "logdna"
      }]
      tags = []
    }
  }
}

variable "observer_observability_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the observer observability access group"
  default     = {}
}

variable "observer_observability_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer observability group"
  default     = false
}

variable "observer_observability_ag_description" {
  type        = string
  description = "Description of the observer observability access group"
  default     = null
}

variable "observer_observability_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "observer_observability_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer observability access group"
  default     = null
}

variable "observer_observability_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer observability access group"
  default     = null
}

##############################################################################
# Observer Security Services Variables
##############################################################################

variable "observer_security_ag_name" {
  type        = string
  description = "Name of the Observer Security access group"
  default     = "observer-security-group"
}

variable "observer_security_ag_policies" {
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
  description = "A map of policies for the Observer Security access group, has a set of default policies that can be overridden"
  default = {
    "hs-crypto" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        service = "hs-crypto"
      }]
      tags = []
    }
    "kms" = {
      roles = ["Reader"]
      resources = [{
        service = "kms"
      }]
      tags = []
    }
    "compliance" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        service = "compliance"
      }]
      tags = []
    }
    "secrets-manager" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        service = "secrets-manager"
      }]
      tags = []
    }
  }
}

variable "observer_security_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the observer security access group"
  default     = {}
}

variable "observer_security_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer security group"
  default     = false
}

variable "observer_security_ag_description" {
  type        = string
  description = "Description of the observer security access group"
  default     = null
}

variable "observer_security_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "observer_security_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer security access group"
  default     = null
}

variable "observer_security_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer security access group"
  default     = null
}

##############################################################################
# Observer Network Services Variables
##############################################################################

variable "observer_network_ag_name" {
  type        = string
  description = "Name of the Observer Network access group"
  default     = "observer-network-group"
}

variable "observer_network_ag_policies" {
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
  description = "A map of policies for the Observer Network access group, has a set of default policies that can be overridden"
  default = {
    "endpoint-gateway" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.endpoint-gateway"
      }]
      tags = []
    }
    "floating-ip" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.floating-ip"
      }]
      tags = []
    }
    "load-balancer" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.load-balancer"
      }]
      tags = []
    }
    "network-acl" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.network-acl"
      }]
      tags = []
    }
    "public-gateway" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.public-gateway"
      }]
      tags = []
    }
    "subnet" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.subnet"
      }]
      tags = []
    }
    "virtual-network-interface" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.virtual-network-interface"
      }]
      tags = []
    }
    "vpn" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.vpn"
      }]
      tags = []
    }
    "vpn-server" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.vpn-server"
      }]
      tags = []
    }
    "vpc" = {
      roles = ["Viewer"]
      resources = [{
        service = "is.vpc"
      }]
      tags = []
    }
    "context-based-restrictions" = {
      roles = ["Viewer"]
      resources = [{
        service = "context-based-restrictions"
      }]
      tags = []
    }
    "context-based-restrictions.zone" = {
      roles = ["Viewer"]
      resources = [{
        service = "context-based-restrictions.zone"
      }]
      tags = []
    }
  }
}

variable "observer_network_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the observer network access group"
  default     = {}
}

variable "observer_network_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer network group"
  default     = false
}

variable "observer_network_ag_description" {
  type        = string
  description = "Description of the observer network access group"
  default     = null
}

variable "observer_network_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "observer_network_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer network access group"
  default     = null
}

variable "observer_network_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer network access group"
  default     = null
}

##############################################################################
# Observer Compute Services Variables
##############################################################################

variable "observer_compute_ag_name" {
  type        = string
  description = "Name of the Observer Compute access group"
  default     = "observer-compute-group"
}

variable "observer_compute_ag_policies" {
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
  description = "A map of policies for the Observer Compute access group, has a set of default policies that can be overridden"
  default = {
    "codeengine" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        services = "codeengine"
      }]
      tags = []
    }
    "containers-kubernetes" = {
      roles = ["Viewer", "Reader"]
      resources = [{
        services = "containers-kubernetes"
      }]
      tags = []
    }
    "is.instance" = {
      roles = ["Viewer"]
      resources = [{
        services = "is.instance"
      }]
      tags = []
    }
    "is.instance-group" = {
      roles = ["Viewer"]
      resources = [{
        services = "is.instance-group"
      }]
      tags = []
    }
    "is.key" = {
      roles = ["Viewer"]
      resources = [{
        services = "is.key"
      }]
      tags = []
    }
    "is.bare-metal-server" = {
      roles = ["Viewer"]
      resources = [{
        services = "is.bare-metal-server"
      }]
      tags = []
    }
    "is.dedicated-host" = {
      roles = ["Viewer"]
      resources = [{
        services = "is.dedicated-host"
      }]
      tags = []
    }
    "is.image" = {
      roles = ["Viewer"]
      resources = [{
        services = "is.image"
      }]
      tags = []
    }
    "is.reservation" = {
      roles = ["Viewer"]
      resources = [{
        services = "is.reservation"
      }]
      tags = []
    }
  }
}

variable "observer_compute_ag_dynamic_rules" {
  type = map(object({
    expiration        = number
    identity_provider = string
    conditions = list(object({
      claim    = string
      operator = string
      value    = string
    }))
  }))
  description = "A map of dynamic rules for the observer compute access group"
  default     = {}
}

variable "observer_compute_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer compute group"
  default     = false
}

variable "observer_compute_ag_description" {
  type        = string
  description = "Description of the observer compute access group"
  default     = null
}

variable "observer_compute_ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "observer_compute_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer compute access group"
  default     = null
}

variable "observer_compute_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer compute access group"
  default     = null
}

variable "custom_roles" {
  description = "IAM custom roles for Access Groups"
  type = list(object({
    name         = string
    service      = string
    display_name = string
    actions      = list(string)
    description  = optional(string, "")
  }))
  default = []
}
