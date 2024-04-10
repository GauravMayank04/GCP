#creating service account
service_accounts_list = [
  {
    project_id    = "prj-stg-svc-forbesca"
    prefix        = ""
    display_name  = "sa-gce-jumphost-stg-forbes"
    names         = ["sa-gce-jumphost-stg-forbes"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },
  {
    project_id    = "prj-stg-svc-forbesca"
    prefix        = ""
    display_name  = "sa-gce-solr-stg-forbes"
    names         = ["sa-gce-solr-stg-forbes"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },
  {
    project_id    = "prj-stg-svc-forbesca"
    prefix        = ""
    display_name  = "sa-gce-stg-forbes-frontend"
    names         = ["sa-gce-stg-forbes-frontend"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },
  {
    project_id    = "prj-stg-svc-forbesca"
    prefix        = ""
    display_name  = "sa-gce-stg-forbes-cms"
    names         = ["sa-gce-stg-forbes-cms"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },
{
    project_id    = "prj-stg-svc-forbesca"
    prefix        = ""
    display_name  = "sa-stg-jenkins-app" 
    names         = ["sa-stg-jenkins-app"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },

 {
    project_id    = "prj-stg-svc-forbesca"
    prefix        = ""
    display_name  = "sa-bucket-access-stg" 
    names         = ["sa-bucket-access-stg"]
    project_roles = ["prj-stg-svc-forbesca=>roles/logging.logWriter", "prj-stg-svc-forbesca=>roles/monitoring.metricWriter"]
  },

]


