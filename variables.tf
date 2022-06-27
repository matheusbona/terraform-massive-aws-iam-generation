# terraform-massive-aws-iam-generation
#
# Description
# Terraform script to massively generate IAMs, access keys and inline policies for a specific service like SQS or S3, for example.
#
# Script by Matheus Bona

variable "aws_access_key" {
    type = string
}

variable "aws_secret_key" {
    type = string
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "aws_account_id" {
    type = string
}

locals {
    user_data = jsondecode(file("users.json"))
    usernames = [for user in local.user_data.users : user.username ]
}