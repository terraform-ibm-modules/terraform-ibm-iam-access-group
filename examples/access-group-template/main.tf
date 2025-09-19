##################################################################
## Apply access group Template
##################################################################

module "access_group_template" {
  source                   = "../../modules/access-group-template"
  template_name            = "${var.prefix}-access-group-template"
  template_description     = "Example access group template with policy templates"
  access_group_name        = "${var.prefix}-example-access-group"
  access_group_description = "Access group created from template example"

  # Define members for the access group
  members = {
    users    = var.user_ids
    services = var.service_ids
    action_controls = {
      add    = true
      remove = true
    }
  }

  # Define policy templates to attach to the access group
  policy_templates = [
    {
      name        = "${var.prefix}-cos-access-policy-template"
      description = "Policy template for Cloud Object Storage access"
      roles       = ["Reader"]
      attributes = [
        {
          key      = "serviceName"
          value    = "cloud-object-storage"
          operator = "stringEquals"
        }
      ]
    }
  ]

  account_group_ids_to_assign = var.account_group_ids_to_assign
  account_ids_to_assign       = var.account_ids_to_assign
}
