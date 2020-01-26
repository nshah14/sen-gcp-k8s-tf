
module "dev-gke-cluster" {
  source                            = "../module-gke-cluster"
  cluster_name                      = "${var.env}-${var.cluster_name}"
  cluster_region                    = var.cluster_region
  cluster_project                   = var.cluster_project
  cluster_initial_node_count        = var.cluster_initial_node_count

 
 cluster_username                   = var.cluster_username
 cluster_password                   = var.cluster_password
 nodepool_name                      = var.nodepool_name
 node_machine_type                  =  var.node_machine_type
 env                                = var.env
    
}
