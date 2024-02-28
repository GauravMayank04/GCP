#************************************************************
# Custom Roles for service account
#************************************************************

variable "list_of_custom_roles" {
  type = list(object({
    target_id            = string
    role_id              = string
    permissions          = list(string)	
    members              = list(string)	
  }))
}