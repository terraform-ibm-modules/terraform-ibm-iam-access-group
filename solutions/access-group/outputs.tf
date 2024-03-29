output "access_groups" {
  value       = module.access_groups
  description = "Access Groups"
}

output "custom_iam_roles" {
  value       = ibm_iam_custom_role.custom_iam_roles
  description = "Custom IAM Roles"
}
