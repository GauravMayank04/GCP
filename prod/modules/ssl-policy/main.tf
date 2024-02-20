resource "google_compute_ssl_policy" "ssl-policy" {
 // provider        = google.target
  //custom_features = var.compatible_features
  name            = var.ssl_policy_name
  profile         = var.load_balancer_ssl_policy_profile
  min_tls_version = var.min_tls_version
  project        = var.project
}
