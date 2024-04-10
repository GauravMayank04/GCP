#************************************************************
# GCS Bucket
#************************************************************
list_of_buckets = [
  {
    project_id               = "prj-prod-svc-forbes89"
    names                    = ["prod-forbes-01"]
    prefix                   = "bkt"
    location                 = "asia-south1"
    public_access_prevention = "inherited"
    set_viewer_roles         = true
    labels = {
      "billing" : "forbes"
      "environment" : "prod"
      # "functional-name" : "english"
    }
    versioning = {
      prod-forbes-01 : true,
    }
    bucket_viewers = {}
    folders = {
      prod-forbes-01 = []

    }
    bucket_folder = "bkt-prod-forbes-01"
  },
]


