//go:build unit || components || aws_organization_account

package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestAWSOrganizationAccount(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/components/aws_organization_account",
		Vars: map[string]interface{}{
			"account_name": fmt.Sprintf("terraform-modules-examples-test-%s", strings.ToLower(random.UniqueId())),
			"ou_name":      "root",
			"email_prefix": "esten.rye",
			"email_domain": "ryezone.com",
			"tags": map[string]string{
				"environment": "test",
				"project":     "terraform-modules-examples",
			},
		},
	}

	// This will run `terraform init` and `terraform apply`. It will also output the Terraform logs to the console.
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply`. It will also output the Terraform logs to the console.
	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "message")
	assert.Equal(t, "Hello, World! This is a test!", output)
}
