variable "cluster_name" {
  default = "dev-sen-gke-cluster"
#   type    = string
}
variable "cluster_region" {
 default = "us-central1"

}

variable "cluster_project" {
  default = "sen-tf-k8s-dev"

}
variable "cluster_initial_node_count" {
 default = "1"

}

variable "cluster_username" {
  default = ""

}

variable "cluster_password" {
 default = ""

}
variable "nodepool_name" {
  default = "sen-node-pool"

}

variable "node_machine_type" {
  default = "n1-standard-1"

}

variable "env" {
  default = "dev"

}