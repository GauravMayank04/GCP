# *****************************************************
# global-https-lb
# *****************************************************

list_of_glb = [
  {
    project               = "prj-prod-svc-news18-engb4"
    name                  = "lb-news18-prod-external-english-cms-as1"
    frontend_name         = "fr-news18-prod-external-english-cms"
    locality_lb_policy    = "LEAST_REQUEST"
    load_balancing_scheme = "EXTERNAL_MANAGED"
    target_tags           = []
    # firewall_networks = ["vpc-uat-shared-host-news18"]
    # firewall_projects = ["prj-uat-host-news18147"]
    create_health_check_firewall = false
    ssl                          = true
    certificate_map              = null
    ssl_certificates             = ["projects/prj-prod-svc-news18-engb4/global/sslCertificates/star-news18-dot-com"]
    backends = {
      cms = {
        backend_name                    = "bk-news18-prod-external-english-cms"
        description                     = null
        port                            = "80"
        protocol                        = "HTTP"
        port_name                       = "http"
        timeout_sec                     = 295
        enable_cdn                      = false
        custom_response_headers         = null
        security_policy                 = "prod-cloudarmor-eng-glb-news18"
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
          request_path        = "//cms.ibnlive.com/readme.html"
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
            group                        = "projects/prj-prod-svc-news18-engb4/regions/asia-south1/instanceGroups/prod-news18-eng-as1-cms-mig"
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
        hosts = ["cms.ibnlive.com"]
        path_matcher = "path-matcher-1",
        backend = "https://www.googleapis.com/compute/v1/projects/prj-prod-svc-news18-engb4/global/backendServices/bk-news18-prod-external-english-cms"
    }
    ]
  },
   {
    project               = "prj-prod-svc-news18-engb4"
    name                  = "lb-news18-prod-external-english-as1"
    frontend_name         = "fr-news18-prod-external-english-as1"
    locality_lb_policy    = "LEAST_REQUEST"
    load_balancing_scheme = "EXTERNAL_MANAGED"
    target_tags           = []
    # firewall_networks = ["vpc-uat-shared-host-news18"]
    # firewall_projects = ["prj-uat-host-news18147"]
    certificate_map = null
    create_health_check_firewall = false
    ssl                          = true
    ssl_certificates             = ["projects/prj-prod-svc-news18-engb4/global/sslCertificates/wildcard-english"]
    backends = {
      frontend = {
        backend_name                    = "bk-news18-prod-external-english-frontend"
        description                     = null
        port                            = "80"
        protocol                        = "HTTP"
        port_name                       = "http"
        timeout_sec                     = 295
        enable_cdn                      = false
        custom_response_headers         = null
        security_policy                 = "prod-cloudarmor-eng-glb-news18"
        compression_mode                = null
        connection_draining_timeout_sec = null
        session_affinity                = null
        affinity_cookie_ttl_sec         = null
        custom_request_headers          = ["NW18-Pass:english"]

        health_check = {
          check_interval_sec  = null
          timeout_sec         = null
          healthy_threshold   = null
          unhealthy_threshold = null
          protocol = "TCP"
          #request_path        = "//cms.ibnlive.com/readme.html"
          port                = "80"
          host                = null
          logging             = null
        }

        log_config = {
          enable      = true
          sample_rate = 1.0
        }

        groups = [
          {
            # Each node pool instance group should be added to the backend.
            group                        = "projects/prj-prod-svc-news18-engb4/regions/asia-south1/instanceGroups/prod-news18-english-as1-frontend-node-mig"
            balancing_mode               = "RATE"
            capacity_scaler              = null
            description                  = null
            max_connections              = null
            max_connections_per_instance = null
            max_connections_per_endpoint = null
            max_rate                     = null
            max_rate_per_instance        = 30
            max_rate_per_endpoint        = null
            max_utilization              = null
          }
        ]

        iap_config = {
          enable               = false
          oauth2_client_id     = null
          oauth2_client_secret = null
        }
      },
      backend = {
        backend_name                    = "bk-news18-prod-external-english-backend"
        description                     = null
        port                            = "80"
        protocol                        = "HTTP"
        port_name                       = "http"
        timeout_sec                     = 295
        enable_cdn                      = false
        custom_response_headers         = null
        security_policy                 = "prod-cloudarmor-eng-glb-news18"
        compression_mode                = null
        connection_draining_timeout_sec = null
        session_affinity                = null
        affinity_cookie_ttl_sec         = null
        custom_request_headers          = ["NW18-Pass:english"]

        health_check = {
          check_interval_sec  = null
          timeout_sec         = null
          healthy_threshold   = null
          unhealthy_threshold = null
          protocol = "TCP"
          #request_path        = "/"
          port                = "80"
          host                = null
          logging             = null
        }

        log_config = {
          enable      = true
          sample_rate = 1.0
        }

        groups = [
          {
            # Each node pool instance group should be added to the backend.
            group                        = "projects/prj-prod-svc-news18-engb4/regions/asia-south1/instanceGroups/prod-news18-english-as1-backend-node-mig"
            balancing_mode               = "RATE"
            capacity_scaler              = null
            description                  = null
            max_connections              = null
            max_connections_per_instance = null
            max_connections_per_endpoint = null
            max_rate                     = null
            max_rate_per_instance        = 50
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
        hosts = ["www.news18.com","beta.news18.com"]
        path_matcher = "path-matcher-1",
        backend = "https://www.googleapis.com/compute/v1/projects/prj-prod-svc-news18-engb4/global/backendServices/bk-news18-prod-external-english-frontend"
    },
    {
        hosts = ["pvt-api-en.news18.com","api-en.news18.com"]
        path_matcher = "path-matcher-2",
        backend = "https://www.googleapis.com/compute/v1/projects/prj-prod-svc-news18-engb4/global/backendServices/bk-news18-prod-external-english-backend"
    }
    ]
  }

]
