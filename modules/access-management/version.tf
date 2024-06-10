terraform {
  required_version = ">= 1.3.0, <1.7.0"
  required_providers {
    # Provider used by the module, ignoring linter warning
    # tflint-ignore: terraform_unused_required_providers
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.66.0"
    }
  }
}
