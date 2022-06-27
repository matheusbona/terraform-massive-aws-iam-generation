# terraform-massive-aws-iam-generation
#
# Description
# Terraform script to massively generate IAMs, access keys and inline policies for a specific service like SQS or S3, for example.
#
# Script by Matheus Bona

init:
	terraform init

plan:
	terraform plan -var-file variables.prod.tfvars

apply:
	terraform apply -var-file variables.prod.tfvars

destroy:
	terraform destroy -var-file variables.prod.tfvars