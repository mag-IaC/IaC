variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
  default = "test"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "westeurope"
}

variable "storage_tier" {
  description = "Storage account performance tier (Standard or Premium)"
  type        = string
  default = "Standard"
}

variable "replication_type" {
  description = "Replication strategy (LRS, ZRS, GRS)"
  type        = string
  default = "LRS" #
}

variable "project_name" {
  description = "Base name for resources"
  type        = string
  default     = "magoblig2"
}
