# IBM Cloud Access Group solution

A deployable architecture solution for managing administrator, privileged, and observer levels of access groups for observability, security, network, and compute categories. Each group has default access policies appropriate for the groups that the policies reside in. In addition to creating the groups and policies, you can provide IBM IDs, Service IDs, and Trusted Profiles to be added to these groups.

![Access Management](../../reference-architectures/access-management.svg)

**Important:** Because this solution contains a provider configuration and is not compatible with the `for_each`, `count`, and `depends_on` arguments, do not call this solution from one or more other modules. For more information about how resources are associated with provider configurations with multiple modules, see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).
