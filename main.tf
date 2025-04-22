## RESOURCE GROUP ##
module "resource_group" {
  source                   = "./modules/resource_group"
  resource_group_variables = var.resource_group_variables
}

## NETWORK SECURITY GROUP ##
module "network_security_group" {
  source                           = "./modules/network_security_group"
  network_security_group_variables = var.network_security_group_variables
  depends_on                       = [module.resource_group]
}

## VIRTUAL NETWORK ##

module "virtual_network" {
  source                    = "./modules/virtual_network"
  virtual_network_variables = var.virtual_network_variables
  depends_on                = [module.network_security_group]
}
