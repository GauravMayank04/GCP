# ******************************************************
# Cloud-Storage
# ******************************************************
variable "list_of_buckets" {
  type = list(object({
    names                    = list(string)
    prefix                   = string
    project_id               = string
    public_access_prevention = string
    labels                   = map(string)
    location                 = string
    versioning               = map(bool)
    set_viewer_roles         = bool
    bucket_viewers           = map(string)
    folders                  = map(list(string))
    bucket_folder            = string
  }))
}

