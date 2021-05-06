terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "tf-remote-state20200716142227954700000002"
    key    = "terraform/webapp/terraform.tfstate"
    region = "eu-west-1"
 }
}


provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "default" {
  default = true
}

module "complete_sg" {
  source = "terraform-aws-modules/security-group/aws"
  name            = "my-sg-test-ismail"
  vpc_id          = data.aws_vpc.default.id
  use_name_prefix = true
  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules = ["https-443-tcp"]
}

output "this_security_group_id" {
  description = "The ID of the security group"
  value       = module.complete_sg.this_security_group_id
}
