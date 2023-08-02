##############################################################################
# IBM IAM Access Group
##############################################################################

module "ibm_iam_access_group" {
  source            = "../.."
  policies          = var.policies
  access_group_name = "${var.prefix}-access-group"
  dynamic_rules     = var.dynamic_rules
  ibm_ids           = var.ibm_ids
}
