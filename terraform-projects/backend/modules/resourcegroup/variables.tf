variable "rg_name" {
  type        = string
  description = "Navnet p� resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "westeurope"
}
