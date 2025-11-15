variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API Key used for creating the access groups and policies in the deployable architecture"
  sensitive   = true
}

variable "provider_visibility" {
  description = "Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints)."
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "public-and-private"], var.provider_visibility)
    error_message = "Invalid visibility option. Allowed values are 'public', 'private', or 'public-and-private'."
  }
}

variable "prefix" {
  type        = string
  nullable    = true
  description = "The prefix to add to all resources that this solution creates (e.g `prod`, `test`, `dev`). To skip using a prefix, set this value to null or an empty string. [Learn more](https://terraform-ibm-modules.github.io/documentation/#/prefix.md)."

  validation {
    # - null and empty string is allowed
    # - Must not contain consecutive hyphens (--): length(regexall("--", var.prefix)) == 0
    # - Starts with a lowercase letter: [a-z]
    # - Contains only lowercase letters (a–z), digits (0–9), and hyphens (-)
    # - Must not end with a hyphen (-): [a-z0-9]
    condition = (var.prefix == null || var.prefix == "" ? true :
      alltrue([
        can(regex("^[a-z][-a-z0-9]*[a-z0-9]$", var.prefix)),
        length(regexall("--", var.prefix)) == 0
      ])
    )
    error_message = "Prefix must begin with a lowercase letter and may contain only lowercase letters, digits, and hyphens '-'. It must not end with a hyphen('-'), and cannot contain consecutive hyphens ('--')."
  }

  validation {
    # must not exceed 16 characters in length
    condition     = var.prefix == null || var.prefix == "" ? true : length(var.prefix) <= 16
    error_message = "Prefix must not exceed 16 characters."
  }
}

variable "admin_observability_ag_name" {
  type        = string
  description = "Name of the Administrator Observability access group"
  default     = "admin-observability-group"
}

variable "admin_observability_ag_description" {
  type        = string
  description = "Description of the admin observability access group"
  default     = null
}

variable "admin_observability_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin observability group"
  default     = false
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

variable "admin_observability_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs that you want to add to the admin observability access group"
  default     = []
}

variable "admin_observability_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your admin observability access group"
  default     = []
}

variable "admin_security_ag_name" {
  type        = string
  description = "Name of the Administrator Security access group"
  default     = "admin-security-group"
}

variable "admin_security_ag_description" {
  type        = string
  description = "Description of the admin security access group"
  default     = null
}

variable "admin_security_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin security group"
  default     = false
}

variable "admin_security_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the admin security access group"
  default     = []
}

variable "admin_security_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the admin security access group"
  default     = []
}

variable "admin_security_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the admin security access group"
  default     = []
}

variable "admin_security_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your admin security access group"
  default     = []
}

variable "admin_network_ag_name" {
  type        = string
  description = "Name of the Administrator Observability access group"
  default     = "admin-network-group"
}

variable "admin_network_ag_description" {
  type        = string
  description = "Description of the admin network access group"
  default     = null
}

variable "admin_network_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin network group"
  default     = false
}

variable "admin_network_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the admin network access group"
  default     = []
}

variable "admin_network_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the admin network access group"
  default     = []
}

variable "admin_network_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the admin network access group"
  default     = []
}

variable "admin_network_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your admin network access group"
  default     = []
}

variable "admin_compute_ag_name" {
  type        = string
  description = "Name of the Administrator Compute access group"
  default     = "admin-compute-group"
}

variable "admin_compute_ag_description" {
  type        = string
  description = "Description of the admin compute access group"
  default     = null
}

variable "admin_compute_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the admin compute group"
  default     = false
}

variable "admin_compute_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the admin compute access group"
  default     = []
}

variable "admin_compute_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the admin compute access group"
  default     = []
}

variable "admin_compute_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the admin compute access group"
  default     = []
}

variable "admin_compute_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your admin compute access group"
  default     = []
}

variable "privileged_observability_ag_name" {
  type        = string
  description = "Name of the Privileged Observability access group"
  default     = "privileged-observability-group"
}

variable "privileged_observability_ag_description" {
  type        = string
  description = "Description of the privileged observability access group"
  default     = null
}

variable "privileged_observability_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged observability group"
  default     = false
}

variable "privileged_observability_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged observability access group"
  default     = []
}

variable "privileged_observability_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged observability access group"
  default     = []
}

variable "privileged_observability_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the privileged observability access group"
  default     = []
}

variable "privileged_observability_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your privileged observability access group"
  default     = []
}

variable "privileged_security_ag_name" {
  type        = string
  description = "Name of the Privileged Security access group"
  default     = "privileged-security-group"
}

variable "privileged_security_ag_description" {
  type        = string
  description = "Description of the privileged security access group"
  default     = null
}

variable "privileged_security_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged security group"
  default     = false
}

variable "privileged_security_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged security access group"
  default     = []
}

variable "privileged_security_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged security access group"
  default     = []
}

variable "privileged_security_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the privileged security access group"
  default     = []
}

variable "privileged_security_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your privileged security access group"
  default     = []
}

variable "privileged_network_ag_name" {
  type        = string
  description = "Name of the Privileged Observability access group"
  default     = "privileged-network-group"
}

variable "privileged_network_ag_description" {
  type        = string
  description = "Description of the privileged network access group"
  default     = null
}

variable "privileged_network_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged network group"
  default     = false
}

variable "privileged_network_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged network access group"
  default     = []
}

variable "privileged_network_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged network access group"
  default     = []
}

variable "privileged_network_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the privileged network access group"
  default     = []
}

variable "privileged_network_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your privileged network access group"
  default     = []
}

variable "privileged_compute_ag_name" {
  type        = string
  description = "Name of the Privileged Compute access group"
  default     = "privileged-compute-group"
}

variable "privileged_compute_ag_description" {
  type        = string
  description = "Description of the privileged compute access group"
  default     = null
}

variable "privileged_compute_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the privileged compute group"
  default     = false
}

variable "privileged_compute_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the privileged compute access group"
  default     = []
}

variable "privileged_compute_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the privileged compute access group"
  default     = []
}

variable "privileged_compute_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the privileged compute access group"
  default     = []
}

variable "privileged_compute_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your privileged compute access group"
  default     = []
}

variable "observer_observability_ag_name" {
  type        = string
  description = "Name of the Observer Observability access group"
  default     = "observer-observability-group"
}

variable "observer_observability_ag_description" {
  type        = string
  description = "Description of the observer observability access group"
  default     = null
}

variable "observer_observability_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer observability group"
  default     = false
}

variable "observer_observability_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer observability access group"
  default     = []
}

variable "observer_observability_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer observability access group"
  default     = []
}

variable "observer_observability_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the observer observability access group"
  default     = []
}

variable "observer_observability_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your observer observability access group"
  default     = []
}

variable "observer_security_ag_name" {
  type        = string
  description = "Name of the Observer Security access group"
  default     = "observer-security-group"
}

variable "observer_security_ag_description" {
  type        = string
  description = "Description of the observer security access group"
  default     = null
}

variable "observer_security_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer security group"
  default     = false
}

variable "observer_security_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer security access group"
  default     = []
}

variable "observer_security_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer security access group"
  default     = []
}

variable "observer_security_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the observer security access group"
  default     = []
}

variable "observer_security_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your observer security access group"
  default     = []
}

variable "observer_network_ag_name" {
  type        = string
  description = "Name of the Observer Network access group"
  default     = "observer-network-group"
}

variable "observer_network_ag_description" {
  type        = string
  description = "Description of the observer network access group"
  default     = null
}

variable "observer_network_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer network group"
  default     = false
}

variable "observer_network_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer network access group"
  default     = []
}

variable "observer_network_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer network access group"
  default     = []
}

variable "observer_network_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the observer network access group"
  default     = []
}

variable "observer_network_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your observer network access group"
  default     = []
}

variable "observer_compute_ag_name" {
  type        = string
  description = "Name of the Observer Compute access group"
  default     = "observer-compute-group"
}

variable "observer_compute_ag_description" {
  type        = string
  description = "Description of the observer compute access group"
  default     = null
}

variable "observer_compute_ag_add_members" {
  type        = bool
  description = "Enable this to add members to the observer compute group"
  default     = false
}

variable "observer_compute_ag_ibm_ids" {
  type        = list(string)
  description = "A list of IBM IDs you want to add to the observer compute access group"
  default     = []
}

variable "observer_compute_ag_service_ids" {
  type        = list(string)
  description = "A list of Service IDs you want to add to the observer compute access group"
  default     = []
}

variable "observer_compute_ag_trusted_profile_ids" {
  type        = list(string)
  description = "A list of Trusted Profile IDs you want to add to the observer compute access group"
  default     = []
}

variable "observer_compute_ag_tags" {
  type        = list(string)
  description = "The list of tags that you want to associated with your observer compute access group"
  default     = []
}
