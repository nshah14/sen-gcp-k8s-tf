
module "dev-sql-pg" {
  source                            = "../module-cloud-sql"
  instance_name                     = "pg-instance-gke-${var.env}"
  database_version                  = var.database_version
  sql_region                        = var.sql_region
  sql_project                       = var.cluster_project
  sql_tier                          = var.sql_tier
  sql_disk_size                     = var.sql_disk_size
  sql_user_name                     = var.sql_user_name
  sql_password                      = var.sql_password
  env = var.env
}

