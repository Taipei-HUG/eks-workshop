######################
# DB Account/Password
######################
resource "random_string" "db_username" {
  length = 8
  special = false
}

resource "random_string" "db_password" {
  length = 16
  special = true
  override_special = "!@#&()=+"
}

##############
# DB Instance
##############

module "db_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/mysql"
  version = "~> 3.0"
  name    = "testirsa"
  vpc_id  = data.aws_vpc.default.id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "db" {
  source = "terraform-aws-modules/rds/aws"
  version = "~> 2.5"

  identifier = "testirsa"

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine            = "mysql"
  engine_version    = "5.7.26"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  storage_encrypted = false

  name                = "test"
  username            = random_string.db_username.result
  password            = random_string.db_password.result
  port                = "3306"
  publicly_accessible = true

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.db_sg.this_security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  enabled_cloudwatch_logs_exports = ["audit", "general"]

  # DB subnet group
  subnet_ids = data.aws_subnet_ids.all.ids

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = false

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8"
    },
    {
      name  = "character_set_server"
      value = "utf8"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}