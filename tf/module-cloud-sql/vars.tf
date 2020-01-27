# variable "cloud_sql_name" {
# #   default = "sen-tf-k8s-dev"
#   type = string
# }
variable "database_version" {
  description =" version of database"
  type = string

}
variable "sql_region" {
  description =" region of database" 
  type = string

}
variable "sql_project" {
  description =" project of database"
  type = string

}
variable "sql_tier" {
 description =" tier of database"
  type = string

}

variable "sql_disk_size" {
  description =" disk size  of database instance"
  type = string

}

variable "sql_user_name" {
  description =" user name of database"
  type = string

}


variable "sql_password" {
  description =" password  of database user"
  type = string

}

variable "env" {
   description =" env of database"
  type = string

}

variable "instance_name" {
   description =" name  of database"
  type = string

}








