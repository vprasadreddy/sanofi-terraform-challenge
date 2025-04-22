## NETWORK SECURITY GROUP OUTPUT ##
output "network_security_group_output" {
  value = { for key, value in azurerm_network_security_group.network_security_group : key => {
    id = value.id
    }
  }
}
