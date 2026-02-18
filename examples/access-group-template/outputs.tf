########################################################################################################################
# Outputs
########################################################################################################################

output "access_group_template_id" {
  description = "The ID of the created access group template"
  value       = module.access_group_template.access_group_template_id
}

output "access_group_template_version" {
  description = "The version of the access group Template"
  value       = module.access_group_template.access_group_template_version
}

output "policy_template_ids" {
  description = "Map of policy template names to their IDs"
  value       = module.access_group_template.policy_template_ids
}

output "all_enterprise_accounts" {
  description = "List of all enterprise accounts returned by the data source"
  value       = module.access_group_template.enterprise_account_ids
}

output "access_group_template_assignment_ids" {
  description = "Map of assignment target keys to their assignment IDs"
  value       = module.access_group_template.template_assignment_ids
}

output "assigned_targets" {
  description = "Map of assigned targets with their IDs and types"
  value       = module.access_group_template.assigned_targets
}
