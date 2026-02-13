##############################################################################
# IAM Access Group Template
#
# Creates access group templates and policy templates, and assigns them
# to specified account groups or accounts
##############################################################################

# Create policy templates first (if any)
resource "ibm_iam_policy_template" "access_group_template_policies" {
  for_each = {
    for pt in var.policy_templates :
    pt.name => pt
  }
  name      = each.value.name
  committed = true

  policy {
    type        = "access"
    description = each.value.description

    roles = each.value.roles

    resource {
      dynamic "attributes" {
        for_each = each.value.attributes != null ? each.value.attributes : []
        content {
          key      = attributes.value.key
          value    = attributes.value.value
          operator = attributes.value.operator
        }
      }
    }
  }

  # Temp workaround for https://github.com/IBM-Cloud/terraform-provider-ibm/issues/6213
  lifecycle {
    replace_triggered_by = [terraform_data.iam_policy_template_replacement]
  }
}

resource "terraform_data" "iam_policy_template_replacement" {
  input = var.policy_templates
}

# Create the access group template
resource "ibm_iam_access_group_template" "access_group_template_instance" {
  name        = var.template_name
  description = var.template_description

  group {
    name        = var.access_group_name
    description = var.access_group_description

    members {
      users    = var.members.users
      services = var.members.services
      action_controls {
        add    = var.members.action_controls.add
        remove = var.members.action_controls.remove
      }
    }

    dynamic "assertions" {
      for_each = var.assertions
      content {
        dynamic "rules" {
          for_each = assertions.value.rules
          content {
            name        = rules.value.name
            expiration  = rules.value.expiration
            realm_name  = rules.value.realm_name
            conditions {
              claim    = rules.value.conditions.claim
              operator = rules.value.conditions.operator
              value    = rules.value.conditions.value
            }
            dynamic "action_control" {
              for_each = rules.value.action_control != null ? [rules.value.action_control] : []
              content {
                remove = action_control.value.remove
              }
            }
          }
        }
        dynamic "action_controls" {
          for_each = assertions.value.action_controls != null ? [assertions.value.action_controls] : []
          content {
            add    = action_controls.value.add
            remove = action_controls.value.remove
          }
        }
      }
    }
  }

  dynamic "policy_template_references" {
    for_each = ibm_iam_policy_template.access_group_template_policies

    content {
      id      = policy_template_references.value.template_id
      version = policy_template_references.value.version
    }
  }

  committed = true

  # Temp workaround for https://github.com/IBM-Cloud/terraform-provider-ibm/issues/6214
  lifecycle {
    replace_triggered_by = [terraform_data.iam_policy_template_replacement]
  }
}

# Get enterprise accounts and groups for assignment
data "ibm_enterprise_accounts" "all_accounts" {}

data "ibm_enterprise_account_groups" "all_groups" {
  depends_on = [data.ibm_enterprise_accounts.all_accounts]
}

# target assignment logic
locals {
  group_targets = [
    for group in data.ibm_enterprise_account_groups.all_groups.account_groups : {
      id   = group.id
      type = "AccountGroup"
    }
  ]

  compared_list = flatten(
    [
      for group in local.group_targets :
      [
        for provided_group in var.account_group_ids_to_assign :
        provided_group if group.id == provided_group
      ]
    ]
  )

  all_groups = length(var.account_group_ids_to_assign) > 0 ? var.account_group_ids_to_assign[0] == "all" ? true : false : false
  # tflint-ignore: terraform_unused_declarations
  validate_group_ids = !local.all_groups ? length(local.compared_list) != length(var.account_group_ids_to_assign) ? tobool("Could not find all of the groups listed in the 'account_group_ids_to_assign' value. Please verify all values are correct") : true : true

  combined_group_targets = local.all_groups ? {
    for target in local.group_targets :
    "${target.type}-${target.id}" => target
    } : {
    for target in local.group_targets :
    "${target.type}-${target.id}" => target if contains(var.account_group_ids_to_assign, target.id)
  }

  account_targets = [
    for account in data.ibm_enterprise_accounts.all_accounts.accounts : {
      id   = account.id
      type = "Account"
    }
  ]

  compared_account_list = flatten(
    [
      for account in local.account_targets :
      [
        for provided_account in var.account_ids_to_assign :
        provided_account if account.id == provided_account
      ]
    ]
  )
  all_accounts = length(var.account_ids_to_assign) > 0 ? var.account_ids_to_assign[0] == "all" ? true : false : false
  # tflint-ignore: terraform_unused_declarations
  validate_account_ids = !local.all_accounts ? length(local.compared_account_list) != length(var.account_ids_to_assign) ? tobool("Could not find all of the accounts listed in the 'account_ids_to_assign' value. Please verify all values are correct") : true : true

  combined_account_targets = local.all_accounts ? {
    for target in local.account_targets :
    "${target.type}-${target.id}" => target
    } : {
    for target in local.account_targets :
    "${target.type}-${target.id}" => target if contains(var.account_ids_to_assign, target.id)
  }

  combined_targets = merge(local.combined_group_targets, local.combined_account_targets)
}

# Assign the access group template to targets
resource "ibm_iam_access_group_template_assignment" "access_group_template_assignment_instance" {
  for_each = local.combined_targets

  template_id      = split("/", ibm_iam_access_group_template.access_group_template_instance.id)[0]
  template_version = ibm_iam_access_group_template.access_group_template_instance.version
  target           = each.value.id
  target_type      = each.value.type

  provisioner "local-exec" {
    command = "echo Assigned template to ${each.value.type}: ${each.value.id}"
  }
}
