# *****************************************************
# cloud-armor
# *****************************************************

list_of_cloud_armor = [
  {
    project_id                           = "prj-prod-svc-forbes89"
    name                                 = "prod-cloudarmor-cmn-glb-forbes"
    description                          = "Security Policy"
    default_rule_action                  = "deny(403)"
    type                                 = "CLOUD_ARMOR"
    layer_7_ddos_defense_enable          = true
    layer_7_ddos_defense_rule_visibility = "STANDARD"

    
security_rules = {
 
      "allow_ip_from_this_range_01" = {
      action        = "allow"
       priority      = 9
      description   = "allow ip only from"
      src_ip_ranges = ["35.244.45.199","35.200.202.60","34.93.102.141","35.200.163.172","34.93.120.245","116.50.59.202","124.153.64.254","180.179.160.36","115.245.180.30","122.161.50.157"]
      preview       = false
      }
        "allow_ip_from_this_range_02" = {
        action        = "allow"
        priority      = 11
        description   = "allow ip only from"
        src_ip_ranges = ["104.77.173.0/24","104.90.5.0/24","104.97.76.0/24","117.239.91.0/25","122.15.34.0/25","173.223.235.0/24","184.26.162.0/24","184.51.192.0/24","184.51.193.0/24","184.51.195.0/24"]
        preview       = false
      },
      "allow_ip_from_this_range_03" = {
        action        = "allow"
        priority      = 12
        description   = "allow ip only from"
        src_ip_ranges = ["2.17.47.0/24","23.11.214.0/24","23.11.215.0/24","23.15.33.0/24","23.201.102.0/24","23.201.47.0/24","23.205.80.0/24","23.206.173.0/24","23.218.158.0/24","23.218.249.0/24"]
        preview       = false
      },
      "allow_ip_from_this_range_04" = {
        action        = "allow"
        priority      = 13
        description   = "allow ip only from"
        src_ip_ranges = ["23.41.186.0/24","23.44.10.0/24","23.55.246.0/24","23.63.110.0/24","23.65.124.0/24","49.44.115.0/24","49.44.121.0/25","49.44.137.0/24","49.44.216.0/25","61.213.168.0/24"]
        preview       = false
      },
 
      "allow_ip_from_this_range_05" = {
        action        = "allow"
        priority      = 14
        description   = "allow ip only from"
        src_ip_ranges = ["61.213.189.0/24","69.192.1.0/24","88.221.53.0/24","96.17.194.0/24","104.75.169.0/24","104.91.59.0/24","104.94.18.0/24","104.97.76.0/24","106.51.156.128/27","117.239.189.0/25"]
        preview       = false
      },
 
      "allow_ip_from_this_range_06" = {
        action        = "allow"
        priority      = 15
        description   = "allow ip only from"
        src_ip_ranges = ["184.28.218.0/24","2.16.188.0/24","2.22.234.0/24","23.205.101.0/24","23.205.80.0/24","23.209.103.0/24","23.211.135.0/24","23.34.81.0/24","23.47.126.0/24","23.55.245.0/24"]
        preview       = false
      },
 
      "allow_ip_from_this_range_07" = {
        action        = "allow"
        priority      = 16
        description   = "allow ip only from"
        src_ip_ranges = ["23.55.37.0/24","23.55.56.0/24","23.56.101.0/24","23.63.109.0/24","23.64.59.0/24","49.207.47.64/26","49.44.117.0/24","49.44.95.128/26","61.213.189.0/24","95.101.22.0/24"]
        preview       = false
      },
        "allow_ip_from_this_range_08" = {
        action        = "allow"
        priority      = 17
        description   = "allow ip only from"
        src_ip_ranges = ["96.17.194.0/24","104.64.0.0/10","118.214.0.0/16","124.40.41.200/29","125.252.224.36/31","125.56.219.52/31","172.232.0.0/13","173.205.7.116/31","173.222.0.0/15","184.24.0.0/13"]
        preview       = false
      },
        "allow_ip_from_this_range_09" = {
        action        = "allow"
        priority      = 18
        description   = "allow ip only from"
        src_ip_ranges = ["184.50.0.0/15","184.84.0.0/14","192.204.11.4/31","193.108.155.118/32","2.16.0.0/13","201.33.187.68/30","203.69.138.120/30","204.1.136.238/31","204.2.159.68/31","204.2.160.182/31"]
        preview       = false
      },
        "allow_ip_from_this_range_10" = {
        action        = "allow"
        priority      = 19
        description   = "allow ip only from"
        src_ip_ranges = ["204.201.160.246/31","205.185.205.132/31","207.126.104.118/31","209.107.208.188/31","209.249.98.36/31","220.90.198.178/31","23.0.0.0/12","23.192.0.0/11","23.32.0.0/11","23.64.0.0/14"]
        preview       = false
      },
        "allow_ip_from_this_range_11" = {
        action        = "allow"
        priority      = 20
        description   = "allow ip only from"
        src_ip_ranges = ["23.72.0.0/13","60.254.173.30/31","61.111.58.82/31","63.217.211.110/31","63.217.211.116/31","63.235.21.192/31","64.145.89.236/31","65.124.174.194/31","66.198.26.68/30","66.198.8.167/32"]
        preview       = false
      },
         "allow_ip_from_this_range_12" = {
        action        = "allow"
        priority      = 21
        description   = "allow ip only from"
        src_ip_ranges = ["66.198.8.168/32","67.220.143.216/31","69.192.0.0/16","69.31.121.20/31","69.31.138.100/31","72.246.0.0/15","77.67.85.52/31","8.18.43.199/32","8.18.43.240/32","88.221.0.0/16"]
        preview       = false
      },
       "allow_ip_from_this_range_13" = {
        action        = "allow"
        priority      = 22
        description   = "allow ip only from"
        src_ip_ranges = ["92.122.0.0/15","95.100.0.0/15","96.16.0.0/15","96.6.0.0/15","104.64.0.0/10","118.214.0.0/16","173.222.0.0/15","184.24.0.0/13","184.50.0.0/15","184.84.0.0/14"]
        preview       = false
      },
       "allow_ip_from_this_range_14" = {
        action        = "allow"
        priority      = 23
        description   = "allow ip only from"
        src_ip_ranges = ["2.16.0.0/13","23.0.0.0/12","23.192.0.0/11","23.32.0.0/11","23.64.0.0/14","23.72.0.0/13","69.192.0.0/16","72.246.0.0/15","88.221.0.0/16","92.122.0.0/15"]
        preview       = false
      },
       "allow_ip_from_this_range_15" = {
        action        = "allow"
        priority      = 24
        description   = "allow ip only from"
        src_ip_ranges = ["95.100.0.0/15","96.16.0.0/15","96.6.0.0/15"]
        preview       = false
      },
    }
  }
]