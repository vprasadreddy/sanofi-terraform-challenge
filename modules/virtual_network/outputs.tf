## VIRTUAL NETWORK OUTPUT ##
output "virtual_network_output" {
  value = { for key, value in azurerm_virtual_network.virtual_network : key => {
    id            = value.id
    name          = value.name
    address_space = value.address_space
    }
  }
}
