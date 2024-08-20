locals {
  ag_list = [
    {
      # admin observability
      "access_group_name"   = var.admin_observability_ag_name
      "policies"            = var.admin_observability_ag_policies
      "dynamic_rules"       = var.admin_observability_ag_dynamic_rules
      "add_members"         = var.admin_observability_ag_add_members
      "description"         = var.admin_observability_ag_description
      "tags"                = var.admin_observability_ag_tags
      "ibm_ids"             = var.admin_observability_ag_ibm_ids
      "service_ids"         = var.admin_observability_ag_service_ids
      "trusted_profile_ids" = var.admin_observability_ag_trusted_profile_ids
      }, {
      # admin security
      "access_group_name"   = var.admin_security_ag_name
      "policies"            = var.admin_security_ag_policies
      "dynamic_rules"       = var.admin_security_ag_dynamic_rules
      "add_members"         = var.admin_security_ag_add_members
      "description"         = var.admin_security_ag_description
      "tags"                = var.admin_security_ag_tags
      "ibm_ids"             = var.admin_security_ag_ibm_ids
      "service_ids"         = var.admin_security_ag_service_ids
      "trusted_profile_ids" = var.admin_security_ag_trusted_profile_ids
      }, {
      # admin network
      "access_group_name"   = var.admin_network_ag_name
      "policies"            = var.admin_network_ag_policies
      "dynamic_rules"       = var.admin_network_ag_dynamic_rules
      "add_members"         = var.admin_network_ag_add_members
      "description"         = var.admin_network_ag_description
      "tags"                = var.admin_network_ag_tags
      "ibm_ids"             = var.admin_network_ag_ibm_ids
      "service_ids"         = var.admin_network_ag_service_ids
      "trusted_profile_ids" = var.admin_network_ag_trusted_profile_ids
      }, {
      # admin compute
      "access_group_name"   = var.admin_compute_ag_name
      "policies"            = var.admin_compute_ag_policies
      "dynamic_rules"       = var.admin_compute_ag_dynamic_rules
      "add_members"         = var.admin_compute_ag_add_members
      "description"         = var.admin_compute_ag_description
      "tags"                = var.admin_compute_ag_tags
      "ibm_ids"             = var.admin_compute_ag_ibm_ids
      "service_ids"         = var.admin_compute_ag_service_ids
      "trusted_profile_ids" = var.admin_compute_ag_trusted_profile_ids
      }, {
      # privileged observability
      "access_group_name"   = var.privileged_observability_ag_name
      "policies"            = var.privileged_observability_ag_policies
      "dynamic_rules"       = var.privileged_observability_ag_dynamic_rules
      "add_members"         = var.privileged_observability_ag_add_members
      "description"         = var.privileged_observability_ag_description
      "tags"                = var.privileged_observability_ag_tags
      "ibm_ids"             = var.privileged_observability_ag_ibm_ids
      "service_ids"         = var.privileged_observability_ag_service_ids
      "trusted_profile_ids" = var.privileged_observability_ag_trusted_profile_ids
      }, {
      # privileged security
      "access_group_name"   = var.privileged_security_ag_name
      "policies"            = var.privileged_security_ag_policies
      "dynamic_rules"       = var.privileged_security_ag_dynamic_rules
      "add_members"         = var.privileged_security_ag_add_members
      "description"         = var.privileged_security_ag_description
      "tags"                = var.privileged_security_ag_tags
      "ibm_ids"             = var.privileged_security_ag_ibm_ids
      "service_ids"         = var.privileged_security_ag_service_ids
      "trusted_profile_ids" = var.privileged_security_ag_trusted_profile_ids
      }, {
      # privileged network
      "access_group_name"   = var.privileged_network_ag_name
      "policies"            = var.privileged_network_ag_policies
      "dynamic_rules"       = var.privileged_network_ag_dynamic_rules
      "add_members"         = var.privileged_network_ag_add_members
      "description"         = var.privileged_network_ag_description
      "tags"                = var.privileged_network_ag_tags
      "ibm_ids"             = var.privileged_network_ag_ibm_ids
      "service_ids"         = var.privileged_network_ag_service_ids
      "trusted_profile_ids" = var.privileged_network_ag_trusted_profile_ids
      }, {
      # privileged compute
      "access_group_name"   = var.privileged_compute_ag_name
      "policies"            = var.privileged_compute_ag_policies
      "dynamic_rules"       = var.privileged_compute_ag_dynamic_rules
      "add_members"         = var.privileged_compute_ag_add_members
      "description"         = var.privileged_compute_ag_description
      "tags"                = var.privileged_compute_ag_tags
      "ibm_ids"             = var.privileged_compute_ag_ibm_ids
      "service_ids"         = var.privileged_compute_ag_service_ids
      "trusted_profile_ids" = var.privileged_compute_ag_trusted_profile_ids
      }, {
      # observer observability
      "access_group_name"   = var.observer_observability_ag_name
      "policies"            = var.observer_observability_ag_policies
      "dynamic_rules"       = var.observer_observability_ag_dynamic_rules
      "add_members"         = var.observer_observability_ag_add_members
      "description"         = var.observer_observability_ag_description
      "tags"                = var.observer_observability_ag_tags
      "ibm_ids"             = var.observer_observability_ag_ibm_ids
      "service_ids"         = var.observer_observability_ag_service_ids
      "trusted_profile_ids" = var.observer_observability_ag_trusted_profile_ids
      }, {
      # observer security
      "access_group_name"   = var.observer_security_ag_name
      "policies"            = var.observer_security_ag_policies
      "dynamic_rules"       = var.observer_security_ag_dynamic_rules
      "add_members"         = var.observer_security_ag_add_members
      "description"         = var.observer_security_ag_description
      "tags"                = var.observer_security_ag_tags
      "ibm_ids"             = var.observer_security_ag_ibm_ids
      "service_ids"         = var.observer_security_ag_service_ids
      "trusted_profile_ids" = var.observer_security_ag_trusted_profile_ids
      }, {
      # observer network
      "access_group_name"   = var.observer_network_ag_name
      "policies"            = var.observer_network_ag_policies
      "dynamic_rules"       = var.observer_network_ag_dynamic_rules
      "add_members"         = var.observer_network_ag_add_members
      "description"         = var.observer_network_ag_description
      "tags"                = var.observer_network_ag_tags
      "ibm_ids"             = var.observer_network_ag_ibm_ids
      "service_ids"         = var.observer_network_ag_service_ids
      "trusted_profile_ids" = var.observer_network_ag_trusted_profile_ids
      }, {
      # observer compute
      "access_group_name"   = var.observer_compute_ag_name
      "policies"            = var.observer_compute_ag_policies
      "dynamic_rules"       = var.observer_compute_ag_dynamic_rules
      "add_members"         = var.observer_compute_ag_add_members
      "description"         = var.observer_compute_ag_description
      "tags"                = var.observer_compute_ag_tags
      "ibm_ids"             = var.observer_compute_ag_ibm_ids
      "service_ids"         = var.observer_compute_ag_service_ids
      "trusted_profile_ids" = var.observer_compute_ag_trusted_profile_ids
    }
  ]
}

module "access_groups" {
  for_each            = { for obj in local.ag_list : obj.access_group_name => obj }
  source              = "../.."
  access_group_name   = each.value.access_group_name
  policies            = each.value.policies
  dynamic_rules       = each.value.dynamic_rules
  add_members         = each.value.add_members
  description         = each.value.description
  tags                = each.value.tags
  ibm_ids             = each.value.ibm_ids
  service_ids         = each.value.service_ids
  trusted_profile_ids = each.value.trusted_profile_ids
}
