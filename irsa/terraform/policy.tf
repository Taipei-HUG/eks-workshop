data "aws_caller_identity" "current" {}


resource "aws_iam_policy" "test_irsa_rds" {
  name        = "test-irsa-rds"
  path        = "/"
  description = "policy for irsa to access rds"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action" : [
        "rds-db:*"
      ],
      "Resource": "arn:aws:rds-db:*:${data.aws_caller_identity.current.account_id}:dbuser:*/${var.demo_db_user}",
      "Effect": "Allow"
    }
  ]
}
EOF
}