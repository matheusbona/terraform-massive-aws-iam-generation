# terraform-massive-aws-iam-generation
#
# Description
# Terraform script to massively generate IAMs, access keys and inline policies for a specific service like SQS or S3, for example.
#
# Script by Matheus Bona

aws_access_key = "YOUR-ACCESS-KEY" # the access key of the AWS account need to have IAM permission to create resources
aws_secret_key = "YOUR-SECRET-KEY"
region = "us-east-1" #replace with the region of your resources
aws_account_id = "YOUR-AWS-ACCOUNT-ID"