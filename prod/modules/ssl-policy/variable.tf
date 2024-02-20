variable "ssl_policy_name" {
  description = "Name of the SSL policy"
  type        = string
}

variable "min_tls_version" {
  description = "Minimum TLS version"
  type        = string
}

variable "load_balancer_ssl_policy_profile" {
  description = "SSL policy profile"
  type        = string
}

# variable "compatible_features" {
#   description = "List of custom features"
#   type        = list(string)
# }


variable "project" {
  description = "List of custom features"
  type        = string
}
  