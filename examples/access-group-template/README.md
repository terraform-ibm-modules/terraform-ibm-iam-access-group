# Access Group Template example

<!-- BEGIN SCHEMATICS DEPLOY HOOK -->
<a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=iam-access-group-access-group-template-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-iam-access-group/tree/main/examples/access-group-template"><img src="https://img.shields.io/badge/Deploy%20with IBM%20Cloud%20Schematics-0f62fe?logo=ibm&logoColor=white&labelColor=0f62fe" alt="Deploy with IBM Cloud Schematics" style="height: 16px; vertical-align: text-bottom;"></a>
<!-- END SCHEMATICS DEPLOY HOOK -->


An example that demonstrates how to use the `access-group-template` submodule. This example will do the following:

- Create an access group template with a Cloud Object Storage policy template
- Create a policy template that grants Reader access to Cloud Object Storage
- Assign the template to account groups

:warning: This example will only execute on an enterprise account

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGIN SCHEMATICS DEPLOY TIP HOOK -->
:information_source: Ctrl/Cmd+Click or right-click on the Schematics deploy button to open in a new tab
<!-- END SCHEMATICS DEPLOY TIP HOOK -->
