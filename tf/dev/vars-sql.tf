

variable "database_version" {
   default = "POSTGRES_11"
}
variable "sql_region" {
  default = "us-central1"
}

variable "sql_tier" {
  
  default = "db-f1-micro"

}

variable "sql_disk_size" {
  default = "10"
}

variable "sql_user_name" {
  default = "postgres"
}


variable "sql_password" {
  default = "changme"


}








