# Define the version of the Terraoform AWS Provider
# https://github.com/terraform-providers/terraform-provider-aws/releases
# Defines the region in which to deploy your AWS resources

provider "aws" {
  version = "~> 2.4"
  region  = "eu-west-2"
}