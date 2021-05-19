resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name                 = "main"
    git_commit           = "4c0a0a0ba187a79863eda5e100ed07acb19ecf6b"
    git_file             = "vpc.tf"
    git_last_modified_at = "2021-05-19 11:56:36"
    git_last_modified_by = "ismailyenigul@gmail.com"
    git_modifiers        = "ismailyenigul"
    git_org              = "ismailyenigul"
    git_repo             = "terraform-circleci-demo"
    yor_trace            = "490adb76-e3e4-4bf9-9ca4-9a668fa4f576"
  }
}
