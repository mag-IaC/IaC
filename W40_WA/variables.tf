variable "subscription_id" {
  description = "Azure subscription to deploy into"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group to create"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Environment name (dev/test/prod)"
  type        = string
  default     = "dev"
}
