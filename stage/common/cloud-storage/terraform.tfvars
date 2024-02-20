#************************************************************
# GCS Bucket
#************************************************************
list_of_buckets = [
  {
    project_id               = "prj-stg-svc-forbesca"
    names                    = ["stg-forbes-01"]
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
      stg-forbes-01 : true,
    }
    bucket_viewers = {}
    folders = {
      stg-forbes-01 = []

    }
    bucket_folder = "bkt-stg-forbes-01"
  },
]


