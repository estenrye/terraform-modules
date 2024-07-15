terraform {
  required_version = ">= 1.1"
}

module "hello_world" {
  source = "../../../modules/components/terraform_hello_world"

  message = var.message
}

output "message" {
  value = module.hello_world.message
}