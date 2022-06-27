# terraform-massive-aws-iam-generation
#
# Description
# Terraform script to massively generate IAMs, access keys and inline policies for a specific service like SQS or S3, for example.
#
# Script by Matheus Bona

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}