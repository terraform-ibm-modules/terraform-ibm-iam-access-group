# Access Group Template example

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