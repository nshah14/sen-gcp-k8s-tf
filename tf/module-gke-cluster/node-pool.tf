resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.nodepool_name
  location   = var.cluster_region
  cluster    = google_container_cluster.gke_cluster.name
  project     = var.cluster_project
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.node_machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.env
    }
  }
}