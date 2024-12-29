variable "ca_country" {
  description = "CA certificate country."
  default     = "US"
}

variable "ca_province" {
  description = "CA certificate province."
  default     = "California"
}

variable "ca_locality" {
  description = "CA certificate city."
  default     = "San Francisco"
}

variable "ca_common_name" {
  description = "CA certificate Common Name."
  default     = "InfraHouseRootCA"
}

variable "ca_organization" {
  description = "CA certificate Organization."
  default     = "InfraHouse Inc."
}

variable "ca_organization_unit" {
  description = "CA certificate Organization Unit."
  default     = "Infrastructure Team"
}

variable "ca_length" {
  description = "CA key length in bits."
  default     = 4096
}

variable "ca_validity_years" {
  description = "CA certificate validity period in years."
  type        = number
  default     = 10
}

variable "ca_key_readers" {
  description = "List of role ARNs that can read a ca.key secret."
  default     = null
  type        = list(string)
}

variable "ca_pem_readers" {
  description = "List of role ARNs that can read a ca.pem secret."
  default     = null
  type        = list(string)
}

variable "environment" {
  description = "Name of environment."
  type        = string
  default     = "development"
}

variable "name_prefix" {
  description = "A prefix for Trust Store and S3 bucket."
  default     = "infrahouse-"
}

variable "service_name" {
  description = "Descriptive name of a service that will use this secret."
  type        = string
  default     = "unknown"
}
