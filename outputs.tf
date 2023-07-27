##############################################################################
# Outputs
##############################################################################

output "id" {
  description = "The ID of the access group"
  value       = var.provision ? ibm_iam_access_group.access_group[0].id : data.ibm_iam_access_group.access_group_data[0].groups[0].id
}

output "dynamic_rule_ids" {
  description = "List of access group dynamic rule IDs"
  value = toset([
    for rule in ibm_iam_access_group_dynamic_rule.access_group_dynamic_rule : rule.id
  ])
}

output "member_id" {
  description = "The unique identifier of the access group members."
  value       = concat(ibm_iam_access_group_members.access_group_members[*].id, [""])[0]
}

output "policy_ids" {
  description = "List of access group policy IDs"
  value = toset([
    for policy in ibm_iam_access_group_policy.policy : policy.id
  ])
}
