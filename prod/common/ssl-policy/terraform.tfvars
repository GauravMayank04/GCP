list_of_ssl_policy = [
  {
    ssl_policy_name                  = "custom-ssl-policy"
    min_tls_version                  = "TLS_1_2"
    load_balancer_ssl_policy_profile = "COMPATIBLE"
    //compatible_features = ["TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"]
    project = "prj-prod-svc-forbes89"
  },
 /* {
    ssl_policy_name                  = "custom-ssl-policy-media"
    min_tls_version                  = "TLS_1_2"
    load_balancer_ssl_policy_profile = "COMPATIBLE"
    //compatible_features = ["TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"]
    project = "prj-uat-svc-news18-media47"
  },
  {
    ssl_policy_name                  = "custom-ssl-policy-18app"
    min_tls_version                  = "TLS_1_2"
    load_balancer_ssl_policy_profile = "COMPATIBLE"
    //compatible_features = ["TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA", "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"]
    project = "prj-stg-svc-18app47"
  },*/
]

