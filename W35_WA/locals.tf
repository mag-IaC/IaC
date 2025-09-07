locals {
  prefix = "mag-"
  suffix = "-dcst3005"

  defaults = {
    default_location = "westeurope"
    default_rg       = "mag-rg-dcst3005"

    tags = {
      owner       = "magnolan@stud.ntnu.no"
      costcenter  = "dcst3005"
      project     = "DCST3005"
      environment = "test"
    }
  }
  
  config_var = {
    subscription_id = "a3adf20e-4966-4afb-b717-4de1baae6db1"
  }
}
