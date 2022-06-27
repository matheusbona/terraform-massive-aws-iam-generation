# terraform-massive-aws-iam-generation
#
# Description
# Terraform script to massively generate IAMs, access keys and inline policies for a specific service like SQS or S3, for example.
#
# Script by Matheus Bona

resource "aws_iam_user" "useraccount" {
    for_each = toset(local.usernames)
    name = each.value

    tags = {
        Name = "${local.user_data.users[index(local.usernames, each.value)].clientname}"
    }
}

resource "aws_iam_access_key" "user_access_key" {
   for_each = toset(local.usernames)
   user = aws_iam_user.useraccount[each.key].name
}

resource "aws_iam_user_policy" "useraccount_ro" {
  for_each = toset(local.usernames)
  name = "useraccount_ro_${aws_iam_user.useraccount[each.key].name}"
  user = aws_iam_user.useraccount[each.key].name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:sqs:${var.region}:${var.aws_account_id}:${local.user_data.users[index(local.usernames, each.value)].queuename}"
      },
      {
        Action = [
          "sqs:*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:sqs:${var.region}:${var.aws_account_id}:my_queue_in.fifo"
      },
    ]
  })
}