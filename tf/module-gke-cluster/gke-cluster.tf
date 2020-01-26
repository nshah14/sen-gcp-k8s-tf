resource "google_container_cluster" "gke_cluster" {
  name                     = var.cluster_name
  location                   = var.cluster_region
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

data "template_file" "kubeconfig" {
  template = file("${path.module}/kubeconfig.yaml")

  vars = {
    cluster_name    = google_container_cluster.gke_cluster.name
    user_name       = google_container_cluster.gke_cluster.master_auth[0].username
    user_password   = google_container_cluster.gke_cluster.master_auth[0].password
    endpoint        = google_container_cluster.gke_cluster.endpoint
    cluster_ca      = google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate
    client_cert     = google_container_cluster.gke_cluster.master_auth[0].client_certificate
    client_cert_key = google_container_cluster.gke_cluster.master_auth[0].client_key
  }
}

resource "local_file" "kubeconfig" {
  content  = data.template_file.kubeconfig.rendered
  filename = "kubeconfig"
}
output "kubeconfig_path" {
  value = local_file.kubeconfig.filename
}
