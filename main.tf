#############################################################################
# terraform-ibm-iam-access-group
#############################################################################

resource "ibm_iam_access_group" "access_group" {
  count       = var.provision ? 1 : 0
  name        = var.access_group_name
  description = var.description
  tags        = var.tags
}

data "ibm_iam_access_group" "access_group_data" {
  count             = var.provision ? 0 : 1
  access_group_name = var.access_group_name
}

resource "ibm_iam_access_group_members" "access_group_members" {
  count           = var.add_members ? 1 : 0
  access_group_id = var.provision ? ibm_iam_access_group.access_group[0].id : data.ibm_iam_access_group.access_group_data[0].groups[0].id
  ibm_ids         = var.ibm_ids
  iam_service_ids = var.service_ids
}

resource "ibm_iam_access_group_policy" "policy" {
  access_group_id = var.provision ? ibm_iam_access_group.access_group[0].id : data.ibm_iam_access_group.access_group_data[0].groups[0].id

  for_each = var.policies

  roles              = each.value["roles"]
  account_management = each.value["account_management"]
  tags               = each.value["tags"]

  dynamic "resources" {
    for_each = (each.value["resources"] != null ? each.value["resources"] : [])
    content {
      region               = lookup(element(each.value["resources"], 0), "region", null)
      attributes           = lookup(element(each.value["resources"], 0), "attributes", null)
      service              = lookup(element(each.value["resources"], 0), "service", null)
      resource_instance_id = lookup(element(each.value["resources"], 0), "resource_instance_id", null)
      resource_type        = lookup(element(each.value["resources"], 0), "resource_type", null)
      resource             = lookup(element(each.value["resources"], 0), "resource", null)
      resource_group_id    = lookup(element(each.value["resources"], 0), "resource_group_id", null)
    }
  }

  dynamic "resource_attributes" {
    for_each = (each.value["resource_attributes"] != null ? each.value["resource_attributes"] : [])
    content {
      name     = resource_attributes.value.name
      value    = resource_attributes.value.value
      operator = resource_attributes.value.operator
    }
  }
}

resource "ibm_iam_access_group_dynamic_rule" "access_group_dynamic_rule" {
  access_group_id = var.provision ? ibm_iam_access_group.access_group[0].id : data.ibm_iam_access_group.access_group_data[0].groups[0].id

  for_each = var.dynamic_rules

  name              = each.key
  expiration        = each.value["expiration"]
  identity_provider = each.value["identity_provider"]

  dynamic "conditions" {
    for_each = each.value["conditions"]
    content {
      claim    = conditions.value.claim
      operator = conditions.value.operator
      value    = conditions.value.value
    }
  }
}
