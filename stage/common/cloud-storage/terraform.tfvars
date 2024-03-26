#************************************************************
# GCS Bucket
#************************************************************
list_of_buckets = [
  {
    project_id               = "prj-stg-svc-forbesca"
    names                    = ["forbes-stg-01"]
    prefix                   = "bkt"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    set_viewer_roles         = true
    labels = {
      "billing" : "forbes"
      "environment" : "stage"
      # "functional-name" : "english"
    }
    versioning = {
      forbes-stg-01 : true,
    }
    bucket_viewers = {}
    folders = {
      forbes-stg-01 = []

    }
    bucket_folder = "bkt-forbes-stg-01"
  },
]


