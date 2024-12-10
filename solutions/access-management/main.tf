module "access_groups" {
  source = "../../modules/access-management"

  admin_observability_ag_name                = try("${var.prefix}-${var.admin_observability_ag_name}", var.admin_observability_ag_name)
  admin_observability_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.admin_observability_ag_description), " null", "")
  admin_observability_ag_add_members         = var.admin_observability_ag_add_members
  admin_observability_ag_ibm_ids             = var.admin_observability_ag_ibm_ids
  admin_observability_ag_service_ids         = var.admin_observability_ag_service_ids
  admin_observability_ag_trusted_profile_ids = var.admin_observability_ag_trusted_profile_ids
  admin_observability_ag_tags                = var.admin_observability_ag_tags

  admin_security_ag_name                = try("${var.prefix}-${var.admin_security_ag_name}", var.admin_security_ag_name)
  admin_security_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.admin_security_ag_description), " null", "")
  admin_security_ag_add_members         = var.admin_security_ag_add_members
  admin_security_ag_ibm_ids             = var.admin_security_ag_ibm_ids
  admin_security_ag_service_ids         = var.admin_security_ag_service_ids
  admin_security_ag_trusted_profile_ids = var.admin_security_ag_trusted_profile_ids
  admin_security_ag_tags                = var.admin_security_ag_tags

  admin_network_ag_name                = try("${var.prefix}-${var.admin_network_ag_name}", var.admin_network_ag_name)
  admin_network_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.admin_network_ag_description), " null", "")
  admin_network_ag_add_members         = var.admin_network_ag_add_members
  admin_network_ag_ibm_ids             = var.admin_network_ag_ibm_ids
  admin_network_ag_service_ids         = var.admin_network_ag_service_ids
  admin_network_ag_trusted_profile_ids = var.admin_network_ag_trusted_profile_ids
  admin_network_ag_tags                = var.admin_network_ag_tags

  admin_compute_ag_name                = try("${var.prefix}-${var.admin_compute_ag_name}", var.admin_compute_ag_name)
  admin_compute_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.admin_compute_ag_description), " null", "")
  admin_compute_ag_add_members         = var.admin_compute_ag_add_members
  admin_compute_ag_ibm_ids             = var.admin_compute_ag_ibm_ids
  admin_compute_ag_service_ids         = var.admin_compute_ag_service_ids
  admin_compute_ag_trusted_profile_ids = var.admin_compute_ag_trusted_profile_ids
  admin_compute_ag_tags                = var.admin_compute_ag_tags

  privileged_observability_ag_name                = try("${var.prefix}-${var.privileged_observability_ag_name}", var.privileged_observability_ag_name)
  privileged_observability_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.privileged_observability_ag_description), " null", "")
  privileged_observability_ag_add_members         = var.privileged_observability_ag_add_members
  privileged_observability_ag_ibm_ids             = var.privileged_observability_ag_ibm_ids
  privileged_observability_ag_service_ids         = var.privileged_observability_ag_service_ids
  privileged_observability_ag_trusted_profile_ids = var.privileged_observability_ag_trusted_profile_ids
  privileged_observability_ag_tags                = var.privileged_observability_ag_tags

  privileged_security_ag_name                = try("${var.prefix}-${var.privileged_security_ag_name}", var.privileged_security_ag_name)
  privileged_security_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.privileged_security_ag_description), " null", "")
  privileged_security_ag_add_members         = var.privileged_security_ag_add_members
  privileged_security_ag_ibm_ids             = var.privileged_security_ag_ibm_ids
  privileged_security_ag_service_ids         = var.privileged_security_ag_service_ids
  privileged_security_ag_trusted_profile_ids = var.privileged_security_ag_trusted_profile_ids
  privileged_security_ag_tags                = var.privileged_security_ag_tags

  privileged_network_ag_name                = try("${var.prefix}-${var.privileged_network_ag_name}", var.privileged_network_ag_name)
  privileged_network_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.privileged_network_ag_description), " null", "")
  privileged_network_ag_add_members         = var.privileged_network_ag_add_members
  privileged_network_ag_ibm_ids             = var.privileged_network_ag_ibm_ids
  privileged_network_ag_service_ids         = var.privileged_network_ag_service_ids
  privileged_network_ag_trusted_profile_ids = var.privileged_network_ag_trusted_profile_ids
  privileged_network_ag_tags                = var.privileged_network_ag_tags

  privileged_compute_ag_name                = try("${var.prefix}-${var.privileged_compute_ag_name}", var.privileged_compute_ag_name)
  privileged_compute_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.privileged_compute_ag_description), " null", "")
  privileged_compute_ag_add_members         = var.privileged_compute_ag_add_members
  privileged_compute_ag_ibm_ids             = var.privileged_compute_ag_ibm_ids
  privileged_compute_ag_service_ids         = var.privileged_compute_ag_service_ids
  privileged_compute_ag_trusted_profile_ids = var.privileged_compute_ag_trusted_profile_ids
  privileged_compute_ag_tags                = var.privileged_compute_ag_tags

  observer_observability_ag_name                = try("${var.prefix}-${var.observer_observability_ag_name}", var.observer_observability_ag_name)
  observer_observability_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.observer_observability_ag_description), " null", "")
  observer_observability_ag_add_members         = var.observer_observability_ag_add_members
  observer_observability_ag_ibm_ids             = var.observer_observability_ag_ibm_ids
  observer_observability_ag_service_ids         = var.observer_observability_ag_service_ids
  observer_observability_ag_trusted_profile_ids = var.observer_observability_ag_trusted_profile_ids
  observer_observability_ag_tags                = var.observer_observability_ag_tags

  observer_security_ag_name                = try("${var.prefix}-${var.observer_security_ag_name}", var.observer_security_ag_name)
  observer_security_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.observer_security_ag_description), " null", "")
  observer_security_ag_add_members         = var.observer_security_ag_add_members
  observer_security_ag_ibm_ids             = var.observer_security_ag_ibm_ids
  observer_security_ag_service_ids         = var.observer_security_ag_service_ids
  observer_security_ag_trusted_profile_ids = var.observer_security_ag_trusted_profile_ids
  observer_security_ag_tags                = var.observer_security_ag_tags

  observer_network_ag_name                = try("${var.prefix}-${var.observer_network_ag_name}", var.observer_network_ag_name)
  observer_network_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.observer_network_ag_description), " null", "")
  observer_network_ag_add_members         = var.observer_network_ag_add_members
  observer_network_ag_ibm_ids             = var.observer_network_ag_ibm_ids
  observer_network_ag_service_ids         = var.observer_network_ag_service_ids
  observer_network_ag_trusted_profile_ids = var.observer_network_ag_trusted_profile_ids
  observer_network_ag_tags                = var.observer_network_ag_tags

  observer_compute_ag_name                = try("${var.prefix}-${var.observer_compute_ag_name}", var.observer_compute_ag_name)
  observer_compute_ag_description         = replace(format("Created by terraform-ibm-iam-access-group deployable architecture. %v", var.observer_compute_ag_description), " null", "")
  observer_compute_ag_add_members         = var.observer_compute_ag_add_members
  observer_compute_ag_ibm_ids             = var.observer_compute_ag_ibm_ids
  observer_compute_ag_service_ids         = var.observer_compute_ag_service_ids
  observer_compute_ag_trusted_profile_ids = var.observer_compute_ag_trusted_profile_ids
  observer_compute_ag_tags                = var.observer_compute_ag_tags
}
