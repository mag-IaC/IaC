variable "name" {
  description = "Name of the storage account"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
}

variable "location" {
  description = "Azure region for the storage account"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group where storage account will be created"
  type        = string
}

variable "project_name" {
  description = "Project base name for tagging purposes"
  type        = string
}

variable "storage_tier" {
  description = "Performance tier for the storage account (Standard or Premium)"
  type        = string
}

variable "replication_type" {
  description = "Replication strategy for the storage account (LRS, ZRS, GRS)"
  type        = string
}
