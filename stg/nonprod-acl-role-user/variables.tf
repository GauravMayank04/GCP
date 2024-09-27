# Variables for subscription and database IDs
variable "subscription_id" {
  description = "Subscription ID for RedisCloud"
  type        = string
}
 
variable "database_id" {
  description = "Database ID for RedisCloud"
  type        = string
}
 
variable "acl_rule_name" {
  description = "Name of the ACL rule"
  type        = string
}
 
variable "acl_rule" {
  description = "Rule definition for ACL"
  type        = string
}
 
variable "acl_role_name" {
  description = "Name of the ACL role"
  type        = string
}
 
variable "acl_user_name" {
  description = "Name of the ACL user"
  type        = string
}
 
variable "acl_user_password" {
  description = "Password for the ACL user"
  type        = string
}