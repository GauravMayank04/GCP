variable "list_of_ssl_policy" {
  type = list(object({
    ssl_policy_name                  = string
    project                          = string
    min_tls_version                  = string
    load_balancer_ssl_policy_profile = string
  }))
}

