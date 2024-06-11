variable "ibmcloud_api_key" {
  type        = string
  description = "Restricted IBM Cloud API Key used only for writing Log Analysis archives to Cloud Object Storage"
  sensitive   = true
}

variable "prefix" {
  type        = string
  description = "(Optional) Prefix to append to all access groups in the example."
  default     = "access-management"
}

variable "admin_observability_ag_name" {
  type        = string
  description = "The name of the administrator observability access group."
  default     = "admin-obs"
}

variable "admin_network_ag_name" {
  type        = string
  description = "The name of the administrator network access group."
  default     = "admin-net"
}

variable "admin_security_ag_name" {
  type        = string
  description = "The name of the administrator security access group."
  default     = "admin-sec"
}

variable "admin_compute_ag_name" {
  type        = string
  description = "The name of the administrator compute access group."
  default     = "admin-comp"
}

variable "privileged_observability_ag_name" {
  type        = string
  description = "The name of the privileged observability access group."
  default     = "priv-obs"
}

variable "privileged_network_ag_name" {
  type        = string
  description = "The name of the privileged network access group."
  default     = "priv-net"
}

variable "privileged_security_ag_name" {
  type        = string
  description = "The name of the privileged security access group."
  default     = "priv-sec"
}

variable "privileged_compute_ag_name" {
  type        = string
  description = "The name of the privileged compute access group."
  default     = "priv-comp"
}

variable "observer_observability_ag_name" {
  type        = string
  description = "The name of the observer observability access group."
  default     = "obsrv-obs"
}

variable "observer_network_ag_name" {
  type        = string
  description = "The name of the observer network access group."
  default     = "obsrv-net"
}

variable "observer_security_ag_name" {
  type        = string
  description = "The name of the observer security access group."
  default     = "obsrv-sec"
}

variable "observer_compute_ag_name" {
  type        = string
  description = "The name of the observer compute access group."
  default     = "obsrv-comp"
}
