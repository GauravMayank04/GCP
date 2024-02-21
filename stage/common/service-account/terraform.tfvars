#creating service account
service_accounts_list = [
  {
    project_id    = "prj-stg-svc-forbesca"
    prefix        = ""
    display_name  = "sa-gce-jumphost-stg-forbes"
    names         = ["sa-gce-jumphost-stg-forbes"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },

]


