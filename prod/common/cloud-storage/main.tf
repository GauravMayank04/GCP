#************************************************************
# GCS Bucket
#************************************************************
module "cloud_bucket" {
  for_each                 = { for x in var.list_of_buckets : x.bucket_folder => x }
  source                   = "../../modules/gcs"
  names                    = each.value.names
  prefix                   = each.value.prefix
  project_id               = each.value.project_id
  public_access_prevention = each.value.public_access_prevention
  labels                   = each.value.labels
  location                 = each.value.location
  versioning               = each.value.versioning
  set_viewer_roles         = each.value.set_viewer_roles
  bucket_viewers           = each.value.bucket_viewers
  folders                  = each.value.folders
  bucket_folder            = each.value.bucket_folder
}


