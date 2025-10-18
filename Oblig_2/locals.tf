locals {
  rg_name         = "${var.project_name}-rg-${var.environment}"
  storage_account = "${var.project_name}${var.environment}sa"
  subscription_id= "a3adf20e-4966-4afb-b717-4de1baae6db1"
}
