//go:build unit || components || aws_organization_unit

package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/organizations"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func getOrganizationalUnitArn(parentID string, ouName string) (string, string, error) {
	// Retrieve the AWS Organizations Organizational Unit
	orgSvc := organizations.New(session.New())

	input := &organizations.ListOrganizationalUnitsForParentInput{
		ParentId: aws.String(parentID),
	}

	result, err := orgSvc.ListOrganizationalUnitsForParent(input)
	if err != nil {
		return "", "", err
	}

	for _, ou := range result.OrganizationalUnits {
		if aws.StringValue(ou.Name) == ouName {
			return aws.StringValue(ou.Arn), aws.StringValue(ou.Id), nil
		}
	}

	return "", "", nil
}

func TestAWSOrganizationUnit(t *testing.T) {
	runID := strings.ToLower(random.UniqueId())
	ouAName := fmt.Sprintf("terraform-modules-aws_organization_unit-A-%s", runID)
	ouBName := fmt.Sprintf("terraform-modules-aws_organization_unit-B-%s", runID)
	ouBParentPath := fmt.Sprintf("Root/%s", ouAName)
	ouCName := fmt.Sprintf("terraform-modules-aws_organization_unit-C-%s", runID)
	ouCParentPath := fmt.Sprintf("Root/%s/%s", ouAName, ouBName)
	ouDName := fmt.Sprintf("terraform-modules-aws_organization_unit-D-%s", runID)
	ouDParentPath := fmt.Sprintf("Root/%s/%s/%s", ouAName, ouBName, ouCName)
	ouEName := fmt.Sprintf("terraform-modules-aws_organization_unit-E-%s", runID)
	ouEParentPath := fmt.Sprintf("Root/%s/%s/%s/%s", ouAName, ouBName, ouCName, ouDName)

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/components/aws_organization_unit",
		Vars: map[string]interface{}{
			"ou_a_name":        ouAName,
			"ou_b_name":        ouBName,
			"ou_b_parent_path": ouBParentPath,
			"ou_c_name":        ouCName,
			"ou_c_parent_path": ouCParentPath,
			"ou_d_name":        ouDName,
			"ou_d_parent_path": ouDParentPath,
			"ou_e_name":        ouEName,
			"ou_e_parent_path": ouEParentPath,
		},
	}

	// This will run `terraform init` and `terraform apply`. It will also output the Terraform logs to the console.
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply`. It will also output the Terraform logs to the console.
	terraform.InitAndApply(t, terraformOptions)

	rootOUID := terraform.Output(t, terraformOptions, "root_ou_id")
	ouAArn := terraform.Output(t, terraformOptions, "ou_a_arn")
	ouAID := terraform.Output(t, terraformOptions, "ou_a_id")
	ouAParentID := terraform.Output(t, terraformOptions, "ou_a_parent_id")
	ouBArn := terraform.Output(t, terraformOptions, "ou_b_arn")
	ouBID := terraform.Output(t, terraformOptions, "ou_b_id")
	ouBParentID := terraform.Output(t, terraformOptions, "ou_b_parent_id")
	ouCArn := terraform.Output(t, terraformOptions, "ou_c_arn")
	ouCID := terraform.Output(t, terraformOptions, "ou_c_id")
	ouCParentID := terraform.Output(t, terraformOptions, "ou_c_parent_id")
	ouDArn := terraform.Output(t, terraformOptions, "ou_d_arn")
	ouDID := terraform.Output(t, terraformOptions, "ou_d_id")
	ouDParentID := terraform.Output(t, terraformOptions, "ou_d_parent_id")
	ouEArn := terraform.Output(t, terraformOptions, "ou_e_arn")
	ouEID := terraform.Output(t, terraformOptions, "ou_e_id")
	ouEParentID := terraform.Output(t, terraformOptions, "ou_e_parent_id")

	// Validated that Organizational Units are properly parented
	assert.Equal(t, rootOUID, ouAParentID)
	assert.Equal(t, ouAID, ouBParentID)
	assert.Equal(t, ouBID, ouCParentID)
	assert.Equal(t, ouCID, ouDParentID)
	assert.Equal(t, ouDID, ouEParentID)

	// Validate that a single Organizational Unit was created with the correct name under the root Organizational Unit
	// only ou_a should be created under the root Organizational Unit
	actualOuAArn, actualOuAID, err := getOrganizationalUnitArn(rootOUID, ouAName)
	assert.Nil(t, err)
	assert.Equal(t, ouAArn, actualOuAArn)
	assert.Equal(t, ouAID, actualOuAID)
	assert.Equal(t, ouBParentID, actualOuAID)

	// Validate that a single Organizational Unit ou_b was created with the correct name under the ou_a Organizational Unit
	actualOuBArn, actualOuBID, err := getOrganizationalUnitArn(ouAID, ouBName)
	assert.Nil(t, err)
	assert.Equal(t, ouBArn, actualOuBArn)
	assert.Equal(t, ouBID, actualOuBID)
	assert.Equal(t, ouCParentID, actualOuBID)

	// Validate that a single Organizational Unit ou_c was created with the correct name under the ou_b Organizational Unit
	actualOuCArn, actualOuCID, err := getOrganizationalUnitArn(ouBID, ouCName)
	assert.Nil(t, err)
	assert.Equal(t, ouCArn, actualOuCArn)
	assert.Equal(t, ouCID, actualOuCID)
	assert.Equal(t, ouDParentID, actualOuCID)

	// Validate that a single Organizational Unit ou_d was created with the correct name under the ou_c Organizational Unit
	actualOuDArn, actualOuDID, err := getOrganizationalUnitArn(ouCID, ouDName)
	assert.Nil(t, err)
	assert.Equal(t, ouDArn, actualOuDArn)
	assert.Equal(t, ouDID, actualOuDID)
	assert.Equal(t, ouEParentID, actualOuDID)

	// Validate that a single Organizational Unit ou_e was created with the correct name under the ou_d Organizational Unit
	actualOuEArn, actualOuEID, err := getOrganizationalUnitArn(ouDID, ouEName)
	assert.Nil(t, err)
	assert.Equal(t, ouEArn, actualOuEArn)
	assert.Equal(t, ouEID, actualOuEID)
}
