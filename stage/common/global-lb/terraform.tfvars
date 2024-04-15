# *****************************************************
# global-https-lb
# *****************************************************

list_of_glb = [
  {
    project               = "prj-stg-svc-forbesca"
    name                  = "lb-stg-forbes-as1-cms-glb"
    frontend_name         = "fr-forbes-stg-cms"
    locality_lb_policy    = "LEAST_REQUEST"
    load_balancing_scheme = "EXTERNAL_MANAGED"
    target_tags           = []
    # firewall_networks = ["vpc-uat-shared-host-news18"]
    # firewall_projects = ["prj-uat-host-news18147"]
    create_health_check_firewall = false
    certificate_map              = "projects/prj-stg-svc-forbesca/locations/global/certificateMaps/stg-forbes-map"
    ssl                          = true
    ssl_policy                   = "projects/prj-stg-svc-forbesca/global/sslPolicies/custom-ssl-policy"
    ssl_certificates             = ["projects/prj-stg-svc-forbesca/global/sslCertificates/forbes-cert"]
    use_ssl_certificates         = true
    https_redirect               = true
    backends = {
    cms = {
    backend_name                    = "bk-stg-forbes-as1-cms1"
    description                     = "terraform-completely-manages-this-resource"
    port                            = "80"
    protocol                        = "HTTP"
    port_name                       = "http"
    timeout_sec                     = 360
    enable_cdn                      = false
    custom_response_headers         = null
        //security_policy                 = "prod-cloudarmor-eng-glb-news18"
    compression_mode                = null
    connection_draining_timeout_sec = null
    session_affinity                = null
    affinity_cookie_ttl_sec         = null
    custom_request_headers          = null

        health_check = {
          check_interval_sec  = null
          timeout_sec         = null
          healthy_threshold   = null
          unhealthy_threshold = null
          request_path        = "/"
          protocol            = "TCP"
          port                = "80"
          host                = null
          logging             = null
        }

        log_config = {
          enable      = true
          sample_rate = 1.0
        }

        groups = [
          # {
          #   # Each node pool instance group should be added to the backend.
          #   group                        = "projects/prj-prod-svc-news18-engb4/regions/asia-south1/instanceGroups/prod-news18-english-as1-cms-mig"
          #   balancing_mode               = "RATE"
          #   capacity_scaler              = null
          #   description                  = null
          #   max_connections              = null
          #   max_connections_per_instance = null
          #   max_connections_per_endpoint = null
          #   max_rate                     = null
          #   max_rate_per_instance        = 10
          #   max_rate_per_endpoint        = null
          #   max_utilization              = null
          # },
               {
            # Each node pool instance group should be added to the backend.
            group                        = "projects/prj-stg-svc-forbesca/regions/asia-south1/instanceGroups/stg-forbes-as1-cms-mig"
            balancing_mode               = "RATE"
            capacity_scaler              = null
            description                  = null
            max_connections              = null
            max_connections_per_instance = null
            max_connections_per_endpoint = null
            max_rate                     = null
            max_rate_per_instance        = 10
            max_rate_per_endpoint        = null
            max_utilization              = null
          }
        ]

        iap_config = {
          enable               = false
          oauth2_client_id     = null
          oauth2_client_secret = null
        }
      }
    }
            
    host_rule = [
      {
        hosts = ["stg-cms-article.forbesindia.com","stg-cms-blog.forbesindia.com","stg-cms-richlist.forbesindia.com","stg-cms-subs.forbesindia.com"]
        path_matcher = "path-matcher-1",
        backend = "https://www.googleapis.com/compute/v1/projects/prj-stg-svc-forbesca/global/backendServices/bk-stg-forbes-as1-cms1"
    }
    ]
  },
    {
    project               = "prj-stg-svc-forbesca"
    name                  = "lb-stg-forbes-as1-frontend-glb"
    frontend_name         = "lb-stg-forbes-as1-frontend"
    locality_lb_policy    = "LEAST_REQUEST"
    load_balancing_scheme = "EXTERNAL_MANAGED"
    target_tags           = []
    # firewall_networks = ["vpc-uat-shared-host-news18"]
    # firewall_projects = ["prj-uat-host-news18147"]
    create_health_check_firewall = false
    certificate_map              = "projects/prj-stg-svc-forbesca/locations/global/certificateMaps/stg-forbes-nodejs-map"
    ssl                          = true
    ssl_policy                   = "projects/prj-stg-svc-forbesca/global/sslPolicies/custom-ssl-policy"
    ssl_certificates             = ["projects/prj-stg-svc-forbesca/global/sslCertificates/forbes-cert"]
    use_ssl_certificates         = true
    https_redirect               = true
    backends = {
    cms = {
    backend_name                    = "bk-stg-forbes-as1-frontend"
    description                     = "terraform-completely-manages-this-resource"
    port                            = "80"
    protocol                        = "HTTP"
    port_name                       = "http"
    timeout_sec                     = 360
    enable_cdn                      = false
    custom_response_headers         = null
        //security_policy                 = "prod-cloudarmor-eng-glb-news18"
    compression_mode                = null
    connection_draining_timeout_sec = null
    session_affinity                = null
    affinity_cookie_ttl_sec         = null
    custom_request_headers          = null

        health_check = {
          check_interval_sec  = null
          timeout_sec         = null
          healthy_threshold   = null
          unhealthy_threshold = null
          request_path        = "/"
          protocol            = "TCP"
          port                = "80"
          host                = null
          logging             = null
        }

        log_config = {
          enable      = true
          sample_rate = 1.0
        }

        groups = [
          # {
          #   # Each node pool instance group should be added to the backend.
          #   group                        = "projects/prj-prod-svc-news18-engb4/regions/asia-south1/instanceGroups/prod-news18-english-as1-cms-mig"
          #   balancing_mode               = "RATE"
          #   capacity_scaler              = null
          #   description                  = null
          #   max_connections              = null
          #   max_connections_per_instance = null
          #   max_connections_per_endpoint = null
          #   max_rate                     = null
          #   max_rate_per_instance        = 10
          #   max_rate_per_endpoint        = null
          #   max_utilization              = null
          # },
               {
            # Each node pool instance group should be added to the backend.
            group                        = "projects/prj-stg-svc-forbesca/regions/asia-south1/instanceGroups/stg-forbes-as1-frontend-mig"
            balancing_mode               = "RATE"
            capacity_scaler              = null
            description                  = null
            max_connections              = null
            max_connections_per_instance = null
            max_connections_per_endpoint = null
            max_rate                     = null
            max_rate_per_instance        = 10
            max_rate_per_endpoint        = null
            max_utilization              = null
          }
        ]

        iap_config = {
          enable               = false
          oauth2_client_id     = null
          oauth2_client_secret = null
        }
      }
    }
            
    host_rule = [
      {
        hosts = ["stg.forbesindia.com","stg-subs.forbesindia.com"]
        path_matcher = "path-matcher-1",
        backend = "https://www.googleapis.com/compute/v1/projects/prj-stg-svc-forbesca/global/backendServices/bk-stg-forbes-as1-frontend"
    }
    ]
  }
   

]
