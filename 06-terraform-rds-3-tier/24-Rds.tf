# RDS Database 

module "rds_db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.db_instance_identifier

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.large"
  allocated_storage = 5

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.rds_sg.security_group_id]

  maintenance_window  = "Mon:00:00-Mon:03:00"
  backup_window       = "03:00-06:00"
  skip_final_snapshot = true

  tags = {
    terraform   = "true"
    Environment = var.env
  }

  # DB subnet group
  db_subnet_group_name = module.vpc.database_subnet_group
  subnet_ids           = module.vpc.database_subnets

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"


  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}