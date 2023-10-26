resource "google_container_cluster" "primary" {
  name     = "node-app-cluster"
  location = "europe-west6"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       =1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "europe-west6"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  
  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    service_account = google_service_account.kubernetes_cluster_sa.email

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}