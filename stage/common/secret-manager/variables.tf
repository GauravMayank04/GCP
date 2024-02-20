#variable for creation of GSM
variable "list_of_secrets" {
  description = ""
  type = list(object({
    project_id   = string
    secret_id    = string
    location     = string
    # kms_key_name = string
    service      = string
  }))
  default = []
}
