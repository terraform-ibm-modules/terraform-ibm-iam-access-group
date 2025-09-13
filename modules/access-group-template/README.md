# Access Group Template Submodule for IBM Cloud IAM

This Terraform submodule provisions an Access Group Template and associated Policy Templates in IBM Cloud IAM. The template can be applied across all accounts in an enterprise, simplifying access group setup at scale.

## Usage

```hcl
module "access_group_template" {
  source  = "terraform-ibm-modules/iam-access-group/ibm//modules/access-group-template"
  version = "X.Y.Z" # Replace "X.Y.Z" with a release version to lock into a specific release

  template_name            = "Access Group Template example"
  template_description     = "IAM access group template example"
  access_group_name        = "example-access-group"
  access_group_description = "Access group created from template"

  policy_templates = [
    {
      name        = "cos-reader-policy-template"
      description = "Policy template for Cloud Object Storage Reader access"
      roles       = ["Reader"]
      resource = {
        attributes = [
          {
            key      = "serviceName"
            value    = "cloud-object-storage"
            operator = "stringEquals"
          }
        ]
      }
    }
  ]
}
```

### Required IAM access policies

You need the following permissions to run this module.

- Service
  - **Enterprise** service
    - `Viewer` platform access
  - **IAM Identity** service
    - `Template Administrator` platform access
    - `Template Assignment Administrator` platform access

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.82.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_iam_access_group_template.access_group_template_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/iam_access_group_template) | resource |
| [ibm_iam_access_group_template_assignment.access_group_template_assignment_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/iam_access_group_template_assignment) | resource |
| [ibm_iam_policy_template.access_group_template_policies](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/iam_policy_template) | resource |
| [terraform_data.iam_policy_template_replacement](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [ibm_enterprise_account_groups.all_groups](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/enterprise_account_groups) | data source |
| [ibm_enterprise_accounts.all_accounts](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/enterprise_accounts) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_group_description"></a> [access\_group\_description](#input\_access\_group\_description) | Description of the access group to be created from the template | `string` | `null` | no |
| <a name="input_access_group_name"></a> [access\_group\_name](#input\_access\_group\_name) | Name of the access group to be created from the template | `string` | n/a | yes |
| <a name="input_account_group_ids_to_assign"></a> [account\_group\_ids\_to\_assign](#input\_account\_group\_ids\_to\_assign) | A list of account group IDs to assign the template to. Support passing the string 'all' in the list to assign to all account groups. | `list(string)` | <pre>[<br/>  "all"<br/>]</pre> | no |
| <a name="input_account_ids_to_assign"></a> [account\_ids\_to\_assign](#input\_account\_ids\_to\_assign) | A list of account IDs to assign the template to. Support passing the string 'all' in the list to assign to all accounts. | `list(string)` | `[]` | no |
| <a name="input_action_controls"></a> [action\_controls](#input\_action\_controls) | Action controls for the access group | <pre>object({<br/>    add    = optional(bool, true)<br/>    remove = optional(bool, true)<br/>  })</pre> | <pre>{<br/>  "add": true,<br/>  "remove": true<br/>}</pre> | no |
| <a name="input_assertions"></a> [assertions](#input\_assertions) | Dynamic rules for the access group | <pre>list(object({<br/>    rules                      = list(string)<br/>    action_controls           = optional(object({<br/>      add    = optional(bool, true)<br/>      remove = optional(bool, true)<br/>    }))<br/>    context                   = optional(string)<br/>    session_expiration_hours  = optional(number)<br/>    session_invalidation_hours = optional(number)<br/>  }))</pre> | `[]` | no |
| <a name="input_members"></a> [members](#input\_members) | Members to be added to the access group | <pre>object({<br/>    users           = optional(list(string), [])<br/>    services        = optional(list(string), [])<br/>    action_controls = optional(object({<br/>      add    = optional(bool, true)<br/>      remove = optional(bool, true)<br/>    }))<br/>    assertions = optional(object({<br/>      rules                      = list(string)<br/>      action_controls           = optional(object({<br/>        add    = optional(bool, true)<br/>        remove = optional(bool, true)<br/>      }))<br/>      context                   = optional(string)<br/>      session_expiration_hours  = optional(number)<br/>      session_invalidation_hours = optional(number)<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_policy_templates"></a> [policy\_templates](#input\_policy\_templates) | List of policy templates to create and attach to the access group template | <pre>list(object({<br/>    name        = string<br/>    description = optional(string)<br/>    roles       = list(string)<br/>    resource = optional(object({<br/>      attributes = optional(list(object({<br/>        key      = string<br/>        value    = string<br/>        operator = optional(string, "stringEquals")<br/>      })))<br/>      tags = optional(list(string))<br/>    }))<br/>    resource_attributes = optional(list(object({<br/>      key      = string<br/>      value    = string<br/>      operator = optional(string, "stringEquals")<br/>    })))<br/>  }))</pre> | `[]` | no |
| <a name="input_template_description"></a> [template\_description](#input\_template\_description) | Description of the access group template | `string` | `null` | no |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | Name of the access group template | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_group_template_id"></a> [access\_group\_template\_id](#output\_access\_group\_template\_id) | The ID of the created access group template |
| <a name="output_access_group_template_name"></a> [access\_group\_template\_name](#output\_access\_group\_template\_name) | The name of the created access group template |
| <a name="output_access_group_template_version"></a> [access\_group\_template\_version](#output\_access\_group\_template\_version) | The version of the created access group template |
| <a name="output_assigned_targets"></a> [assigned\_targets](#output\_assigned\_targets) | Map of assigned targets with their IDs and types |
| <a name="output_policy_template_ids"></a> [policy\_template\_ids](#output\_policy\_template\_ids) | Map of policy template names to their IDs |
| <a name="output_policy_template_versions"></a> [policy\_template\_versions](#output\_policy\_template\_versions) | Map of policy template names to their versions |
| <a name="output_template_assignment_ids"></a> [template\_assignment\_ids](#output\_template\_assignment\_ids) | Map of assignment target keys to their assignment IDs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->