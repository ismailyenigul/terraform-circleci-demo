terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "tf-remote-state20200716142227954700000002"
    key    = "terraform/circlecitest/terraform.tfstate"
    region = "us-east-2"
  }
}


provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "default" {
  default = true
}

module "complete_sg" {
  // source              = "terraform-aws-modules/security-group/aws"
  source              = "git::git@github.com:/terraform-aws-modules/terraform-aws-security-group.git?ref=v4.0.0"
  name                = "my-sg-test-ismail"
  vpc_id              = data.aws_vpc.default.id
  use_name_prefix     = true
  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules       = ["https-443-tcp"]
   tags = {
    Cash       = "king"
    Department = "kingdom"
  }
}
