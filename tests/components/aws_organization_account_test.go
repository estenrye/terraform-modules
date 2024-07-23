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
	emailPrefix := "test-user"
	emailDomain := "ryezone.com"
	accountName := fmt.Sprintf("tf-mods-aws-org-account-test-%s", strings.ToLower(random.UniqueId()))

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/components/aws_organization_account",
		Vars: map[string]interface{}{
			"account_name": accountName,
			"email_prefix": emailPrefix,
			"email_domain": emailDomain,
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

	parentOuID := terraform.Output(t, terraformOptions, "parent_ou_id")
	assert.Equal(t, "ou-p54p-t67gb0qa", parentOuID)

	name := terraform.Output(t, terraformOptions, "name")
	assert.Equal(t, accountName, name)

	email := terraform.Output(t, terraformOptions, "email")
	expectedEmail := fmt.Sprintf("%s+%s@%s", emailPrefix, accountName, emailDomain)
	assert.Equal(t, expectedEmail, email)

}
