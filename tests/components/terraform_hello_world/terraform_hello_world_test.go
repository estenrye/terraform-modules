package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformHelloWorld(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../../examples/components/terraform_hello_world",
	}

	// This will run `terraform init` and `terraform apply`. It will also output the Terraform logs to the console.
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply`. It will also output the Terraform logs to the console.
	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "message")
	assert.Equal(t, "Hello, World! This is a test!", output)
}
