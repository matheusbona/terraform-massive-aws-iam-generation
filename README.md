# terraform-massive-aws-iam-generation

Terraform script to massively generate IAMs, access keys and inline policies for a specific service like SQS or S3, for example.

## Fast start

1 - Set credentials inside of "variables.prod.tfvars"

2 - Execute init
```
make init
```

3 - Execute plan
```
make plan
```

4 - Execute apply
```
make apply
```

5 - (optional) Execute destroy
```
make destroy
```

6 - Run the PHP script to extract the access keys and secrets of "terraform.tfstate". The "keys.json" file will be generate
```
php extract_keys.php
```

7 - Enjoy :)