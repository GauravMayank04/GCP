#creating service account
service_accounts_list = [
  {
    project_id    = "prj-prod-svc-news18-engb4"
    prefix        = ""
    display_name  = "sa-gce-jumphost-stg"
    names         = ["sa-gce-jumphost-stg"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },
]


