# *****************************************************
# global-https-lb
# *****************************************************

# **************************** CMS *************************

list_of_glb = [
  {
    project               = "prj-prod-svc-forbes89"
    name                  = "lb-prod-forbes-as1-cms-glb"
    frontend_name         = "fr-prod-forbes-cms-glb"
    locality_lb_policy    = "LEAST_REQUEST"
    load_balancing_scheme = "EXTERNAL_MANAGED"
    target_tags           = []
    # firewall_networks = ["vpc-uat-shared-host-news18"]
    # firewall_projects = ["prj-uat-host-news18147"]
    create_health_check_firewall = false
    certificate_map              = "projects/prj-prod-svc-forbes89/locations/global/certificateMaps/cms-forbes-map"
    ssl                          = true
    ssl_policy                   = "projects/prj-prod-svc-forbes89/global/sslPolicies/custom-ssl-policy"
    ssl_certificates             = ["projects/prj-prod-svc-forbes89/global/sslCertificates/prod-forbes-cert"]
    use_ssl_certificates         = true
    https_redirect               = true
    backends = {

      cms-fe = {
        backend_name                    = "bk-forbes-prod-cms-fe"
        description                     = null
        port                            = "80"
        protocol                        = "HTTP"
        port_name                       = "http"
        timeout_sec                     = 30
        enable_cdn                      = false
        custom_response_headers         = null
        //security_policy                 = "prod-cloudarmor-glb-firstpost"
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
          {
            # Each node pool instance group should be added to the backend.
            group                        = "projects/prj-prod-svc-forbes89/regions/asia-south1/instanceGroups/prod-forbes-as1-cms-mig"
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
      },



    }
    host_rule = [

      {
        hosts        = ["cms-article.forbesindia.com","cms-blog.forbesindia.com","cms-richlist.forbesindia.com","cms-subs.forbesindia.com"]
        path_matcher = "path-matcher-1",
        //backend      = "cms"
        backend = "https://www.googleapis.com/compute/v1/projects/prj-prod-svc-forbes89/global/backendServices/bk-forbes-prod-cms-fe"
      }
 
    ]
  },

# *******************************Nodejs**********************************
{
    project               = "prj-prod-svc-forbes89"
    name                  = "lb-prod-forbes-as1-frontend-glb"
    frontend_name         = "fr-prod-forbes-frontend-glb"
    locality_lb_policy    = "LEAST_REQUEST"
    load_balancing_scheme = "EXTERNAL_MANAGED"
    target_tags           = []
    # firewall_networks = ["vpc-uat-shared-host-news18"]
    # firewall_projects = ["prj-uat-host-news18147"]
    create_health_check_firewall = false
    certificate_map              = "projects/prj-prod-svc-forbes89/locations/global/certificateMaps/forbesindia-map"
    ssl                          = true
    ssl_policy                   = "projects/prj-prod-svc-forbes89/global/sslPolicies/custom-ssl-policy"
    ssl_certificates             = ["projects/prj-prod-svc-forbes89/global/sslCertificates/prod-forbes-cert"]
    use_ssl_certificates         = true
    https_redirect               = true
    backends = {

      nodejs-fe = {
        backend_name                    = "bk-forbes-prod-nodejs-fe"
        description                     = null
        port                            = "80"
        protocol                        = "HTTP"
        port_name                       = "http"
        timeout_sec                     = 30
        enable_cdn                      = false
        custom_response_headers         = null
        //security_policy                 = "prod-cloudarmor-glb-firstpost"
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
          {
            # Each node pool instance group should be added to the backend.
            group                        = "projects/prj-prod-svc-forbes89/regions/asia-south1/instanceGroups/prod-forbes-as1-frontend-mig"
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
      },



    }
    host_rule = [

      {
        hosts        = ["www.forbesindia.com","subscription.forbesindia.com"]
        path_matcher = "path-matcher-1",
        //backend      = "cms"
        backend = "https://www.googleapis.com/compute/v1/projects/prj-prod-svc-forbes89/global/backendServices/bk-forbes-prod-nodejs-fe"
      }
 
    ]
  },
]

