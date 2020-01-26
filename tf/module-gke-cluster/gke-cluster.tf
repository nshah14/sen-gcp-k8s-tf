resource "google_container_cluster" "gke_cluster" {
  name                     = var.cluster_name
  location                 = var.cluster_region
  project                  = var.cluster_project
  remove_default_node_pool = true
  initial_node_count       = var.cluster_initial_node_count

  master_auth {
    username = var.cluster_username
    password = var.cluster_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
  

}

