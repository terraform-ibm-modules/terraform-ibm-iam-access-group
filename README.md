<!-- BEGIN MODULE HOOK -->

# IAM Access Group Module
<!-- UPDATE BADGE: Update the link for the following badge-->
[![Graduated (Supported)](https://img.shields.io/badge/Status-Graduated%20(Supported)-brightgreen)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-iam-access-group?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-iam-access-group/releases/latest)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)


This module is used to create an acess group, adding members to access group, defining the acces group policy and adding dynamic rules to access group. Access groups can be used to define a set of permissions that you want to grant to a group of users.
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-iam-access-group](#terraform-ibm-iam-access-group)
* [Examples](./examples)
    * [Basic example](./examples/basic)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl
provider "ibm" {
  ibmcloud_api_key = "XXXXXXXXXX" # pragma: allowlist secret
  region           = "us-south"
}

module "iam_service_access_group" {
  source            = "terraform-ibm-modules/terraform-ibm-iam-access-group"
  version           = "latest" # Replace "latest" with a release version to lock into a specific release
  access_group_name = "my-iam-access-group"
  dynamic_rules     = {
                        rule-name = {
                        expiration        = 3
                        identity_provider = "https://idp-test.example.org/SAML2"
                        conditions = [{
                            claim    = "my_claim"
                            operator = "CONTAINS"
                            value    = "my_test_value"
                        }]
                        }
                    }
  policies          = {
                        my_policy_1 = {
                            roles = ["Viewer"]
                            tags  = ["iam-service-policy-1"]
                        }
                        my_policy_2 = {
                            roles = ["Viewer"]
                            tags  = ["iam-service-policy-2"]
                        }
                    }
  ibm_ids           = ["your_ibm_id_email"]
}
```

### Required IAM access policies

If an account has service ID creation blocked (which an fscloud compliant account will), you need to explicitly grant “Service ID creator” to users in order to be able to grant access.
For more information, see [Creating and working with service IDs](https://cloud.ibm.com/docs/account?topic=account-serviceids&interface=ui).
<!-- END MODULE HOOK -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.51.0, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_iam_access_group.access_group](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/iam_access_group) | resource |
| [ibm_iam_access_group_dynamic_rule.access_group_dynamic_rule](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/iam_access_group_dynamic_rule) | resource |
| [ibm_iam_access_group_members.access_group_members](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/iam_access_group_members) | resource |
| [ibm_iam_access_group_policy.policy](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/iam_access_group_policy) | resource |
| [ibm_iam_access_group.access_group_data](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/data-sources/iam_access_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_group_name"></a> [access\_group\_name](#input\_access\_group\_name) | Name of the access group | `string` | n/a | yes |
| <a name="input_add_members"></a> [add\_members](#input\_add\_members) | Enable this to add members to access group | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description to access group | `string` | `null` | no |
| <a name="input_dynamic_rules"></a> [dynamic\_rules](#input\_dynamic\_rules) | list of dynamic rules | <pre>map(object({<br>    expiration        = number<br>    identity_provider = string<br>    conditions = list(object({<br>      claim    = string<br>      operator = string<br>      value    = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_ibm_ids"></a> [ibm\_ids](#input\_ibm\_ids) | A list of IBM IDs that you want to add to the access group. | `list(string)` | `null` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | list of policies | <pre>map(object({<br>    roles              = list(string)<br>    account_management = optional(bool)<br>    tags               = set(string)<br>    resources = optional(list(object({<br>      region               = optional(string)<br>      attributes           = optional(map(string))<br>      service              = optional(string)<br>      resource_instance_id = optional(string)<br>      resource_type        = optional(string)<br>      resource             = optional(string)<br>      resource_group_id    = optional(string)<br>    })))<br>    resource_attributes = optional(list(object({<br>      name     = string<br>      value    = string<br>      operator = optional(string)<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_provision"></a> [provision](#input\_provision) | Would you like to provision a new access group (true/false) | `bool` | `true` | no |
| <a name="input_service_ids"></a> [service\_ids](#input\_service\_ids) | A list of service IDS that you want to add to the access group. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags that should be applied to the service | `list(string)` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamic_rule_ids"></a> [dynamic\_rule\_ids](#output\_dynamic\_rule\_ids) | List of access group dynamic rule IDs |
| <a name="output_id"></a> [id](#output\_id) | The ID of the access group |
| <a name="output_member_id"></a> [member\_id](#output\_member\_id) | The unique identifier of the access group members. |
| <a name="output_policy_ids"></a> [policy\_ids](#output\_policy\_ids) | List of access group policy IDs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
