########################################################################################################################
# Outputs
########################################################################################################################

output "access_group_template_id" {
  description = "The ID of the created access group template"
  value       = ibm_iam_access_group_template.access_group_template_instance.id
}

output "access_group_template_version" {
  description = "The version of the created access group template"
  value       = ibm_iam_access_group_template.access_group_template_instance.version
}

output "policy_template_ids" {
  description = "Map of policy template names to their IDs"
  value = {
    for name, template in ibm_iam_policy_template.access_group_template_policies :
    name => template.template_id
  }
}

output "policy_template_versions" {
  description = "List of policy template names to their versions"
  value = {
    for name, template in ibm_iam_policy_template.access_group_template_policies :
    name => template.version
  }
}

output "enterprise_account_ids" {
  description = "List of child enterprise account IDs"
  value       = data.ibm_enterprise_accounts.all_accounts.accounts[*].id
}

output "template_assignment_ids" {
  description = "List of assignment target keys to their assignment IDs"
  value = {
    for key, assignment in ibm_iam_access_group_template_assignment.access_group_template_assignment_instance :
    key => assignment.id
  }
}

output "assigned_targets" {
  description = "List of assignment IDs to target accounts"
  value = {
    for key, target in local.combined_targets :
    key => {
      id   = target.id
      type = target.type
    }
  }
}
