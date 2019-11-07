output "db_username" {
  value = random_string.db_username.result
}

output "db_password" {
  value = random_string.db_password.result
}

output "db_address" {
  value = module.db.this_db_instance_address
}

output "db_port" {
  value = "3306"
}

output "db_policy" {
  value = aws_iam_policy.test_irsa_rds.arn
}