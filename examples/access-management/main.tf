module "access_management" {
  source                           = "../../modules/access-management"
  admin_observability_ag_name      = try("${var.prefix}-${var.admin_observability_ag_name}", var.admin_observability_ag_name, null)
  admin_network_ag_name            = try("${var.prefix}-${var.admin_network_ag_name}", var.admin_network_ag_name, null)
  admin_security_ag_name           = try("${var.prefix}-${var.admin_security_ag_name}", var.admin_security_ag_name, null)
  admin_compute_ag_name            = try("${var.prefix}-${var.admin_compute_ag_name}", var.admin_compute_ag_name, null)
  privileged_observability_ag_name = try("${var.prefix}-${var.privileged_observability_ag_name}", var.privileged_observability_ag_name, null)
  privileged_network_ag_name       = try("${var.prefix}-${var.privileged_network_ag_name}", var.privileged_network_ag_name, null)
  privileged_security_ag_name      = try("${var.prefix}-${var.privileged_security_ag_name}", var.privileged_security_ag_name, null)
  privileged_compute_ag_name       = try("${var.prefix}-${var.privileged_compute_ag_name}", var.privileged_compute_ag_name, null)
  observer_observability_ag_name   = try("${var.prefix}-${var.observer_observability_ag_name}", var.observer_observability_ag_name, null)
  observer_network_ag_name         = try("${var.prefix}-${var.observer_network_ag_name}", var.observer_network_ag_name, null)
  observer_security_ag_name        = try("${var.prefix}-${var.observer_security_ag_name}", var.observer_security_ag_name, null)
  observer_compute_ag_name         = try("${var.prefix}-${var.observer_compute_ag_name}", var.observer_compute_ag_name, null)
}
