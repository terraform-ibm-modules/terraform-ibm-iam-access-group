terraform {
  required_version = ">=1.9.0"
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.66.0, < 2.0.0"
    }
  }
}
