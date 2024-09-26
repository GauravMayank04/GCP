variable "subscription_name" {
  description = "Name of the Redis subscription"
  type        = string
}
 
variable "memory_storage" {
  description = "Type of memory storage for Redis"
  type        = string

}
 
variable "cloud_provider" {
  description = "Cloud provider to use (e.g., GCP, AWS)"
  type        = string
}
 
variable "region" {
  description = "Region for the Redis deployment"
  type        = string
}
 
variable "multiple_availability_zones" {
  description = "Whether to use multiple availability zones"
  type        = bool
 
}
 
variable "networking_deployment_cidr" {
  description = "Networking CIDR block for deployment"
  type        = string
}
 
variable "preferred_availability_zones" {
  description = "Preferred availability zones for the deployment"
  type        = list(string)
}
 
variable "memory_limit_in_gb" {
  description = "Memory limit for Redis cluster in GB"
  type        = number
}
 
variable "quantity" {
  description = "Quantity of Redis clusters to provision"
  type        = number
}
 
variable "replication" {
  description = "Enable or disable replication"
  type        = bool
  
}
 
variable "throughput_measurement_by" {
  description = "How throughput is measured (e.g., operations-per-second)"
  type        = string
}
 
variable "throughput_measurement_value" {
  description = "Throughput measurement value"
  type        = number
}
 
variable "database_name" {
  description = "Name of the Redis database"
  type        = string
}
 
variable "database_memory_limit_in_gb" {
  description = "Memory limit for the Redis database in GB"
  type        = number
}
 
variable "data_persistence" {
  description = "Persistence setting for the database (e.g., aof-every-write)"
  type        = string
}
 
variable "database_throughput_measurement_by" {
  description = "Throughput measurement method for the Redis database"
  type        = string
}
 
variable "database_throughput_measurement_value" {
  description = "Throughput measurement value for the Redis database"
  type        = number
}
 
variable "database_replication" {
  description = "Enable or disable replication for the database"
  type        = bool

}
 

 
variable "acl_rule_name" {
  description = "Name of the ACL rule"
  type        = string
}
 
variable "acl_rule" {
  description = "ACL rule definition"
  type        = string
}


