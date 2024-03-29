// Tests in this file are run in the PR pipeline and the continuous testing pipeline
package test

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
)

// Use existing resource group
const resourceGroup = "geretain-test-resources"
const basicExampleDir = "examples/basic"
const daDir = "solutions/access-group"

func setupOptions(t *testing.T, prefix string, dir string) *testhelper.TestOptions {
	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:       t,
		TerraformDir:  dir,
		Prefix:        prefix,
		ResourceGroup: resourceGroup,
	})

	options.TerraformVars = map[string]interface{}{
		"prefix": options.Prefix,
	}
	return options
}

func TestRunBasicExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "iam-access-g-basic", basicExampleDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunBasicUpgradeExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "iam-access-g-upg", basicExampleDir)

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}

func setupDAOptions(t *testing.T, prefix string, dir string) *testhelper.TestOptions {
	options := setupOptions(t, prefix, dir)

	options.TerraformVars["admin_observability_ag_name"] = fmt.Sprintf("%s-admin-obs", options.Prefix)
	options.TerraformVars["admin_network_ag_name"] = fmt.Sprintf("%s-admin-net", options.Prefix)
	options.TerraformVars["admin_security_ag_name"] = fmt.Sprintf("%s-admin-sec", options.Prefix)
	options.TerraformVars["admin_compute_ag_name"] = fmt.Sprintf("%s-admin-comp", options.Prefix)
	options.TerraformVars["privileged_observability_ag_name"] = fmt.Sprintf("%s-priv-obs", options.Prefix)
	options.TerraformVars["privileged_network_ag_name"] = fmt.Sprintf("%s-priv-net", options.Prefix)
	options.TerraformVars["privileged_security_ag_name"] = fmt.Sprintf("%s-priv-sec", options.Prefix)
	options.TerraformVars["privileged_compute_ag_name"] = fmt.Sprintf("%s-priv-comp", options.Prefix)
	options.TerraformVars["observer_observability_ag_name"] = fmt.Sprintf("%s-obsrv-obs", options.Prefix)
	options.TerraformVars["observer_network_ag_name"] = fmt.Sprintf("%s-obsrv-net", options.Prefix)
	options.TerraformVars["observer_security_ag_name"] = fmt.Sprintf("%s-obsrv-sec", options.Prefix)
	options.TerraformVars["observer_compute_ag_name"] = fmt.Sprintf("%s-obsrv-comp", options.Prefix)

	return options
}

func TestRunDA(t *testing.T) {
	t.Parallel()

	options := setupDAOptions(t, "ag-solution", daDir)

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunDAUpgrade(t *testing.T) {
	t.Parallel()

	options := setupDAOptions(t, "ag-upg-solution", daDir)

	output, err := options.RunTestUpgrade()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}
