variable "cluster_name" {
  description = " name of the cluster"
  type    = string
}
variable "cluster_region" {
  description = " region of the cluster"
  type    = string
}

variable "cluster_project" {
  description = " project of the cluster"
  type    = string
}
variable "cluster_initial_node_count" {
  description = " initial node count of the cluster"
  type = number
}

variable "cluster_username" {
  description = " user name for master of the cluster"
  type = string
}

variable "cluster_password" {
  description = " password "
  type = string
}
variable "nodepool_name" {
  description = "nodepool name for cluster"
  type = string
}

variable "node_machine_type" {  
  description = " machine type for nodes"
  type = string
}

variable "env"{
    description  = "for environment "
    type = string
}