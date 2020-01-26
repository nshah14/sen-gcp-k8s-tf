resource "google_sql_database_instance" "master" {
  name             = "${var.env}-pg-instance"
  database_version =  var.database_version
  region           =  var.sql_region
  project          =  var.sql_project

  settings {
    tier              = var.sql_tier
    activation_policy = "ALWAYS"
    disk_size         = var.sql_disk_size
  }
}


output "connection_name" {
  value = google_sql_database_instance.master.connection_name
}



resource "random_id" "rev" {
  byte_length = 4
}

resource "google_sql_user" "users" {
  name     = var.sql_user_name
  instance = google_sql_database_instance.master.name
  host     = "${var.sql_project}.com"
  password = var.sql_password
  project  =  var.sql_project
}

output "google_sql_user" {
  value = google_sql_user.users.name
}
output "google_sql_password" {
  value = google_sql_user.users.password
}