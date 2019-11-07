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
      "Resource": "arn:aws:rds-db:*:163993956761:dbuser:*/irsa",
      "Effect": "Allow"
    }
  ]
}
EOF
}