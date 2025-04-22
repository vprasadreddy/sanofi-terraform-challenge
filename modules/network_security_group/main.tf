resource "azurerm_network_security_group" "network_security_group" {
  for_each            = var.network_security_group_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.resource_group_location
  dynamic "security_rule" {
    for_each = lookup(each.value, "security_rule", null) != null ? toset(each.value.security_rule) : []
    content {
      name                       = security_rule.value.name
      description                = security_rule.value.description
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
      access                     = security_rule.value.access
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
    }
  }
  tags = each.value.tags
}
