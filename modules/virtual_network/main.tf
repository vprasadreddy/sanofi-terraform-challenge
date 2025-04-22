locals {
  network_security_groups_list = flatten([for virtual_network_key, virtual_network in var.virtual_network_variables : [for subnet in virtual_network.subnets : [{
    virtual_network_key                        = virtual_network_key
    subnet_name                                = subnet.name
    network_security_group_name                = subnet.network_security_group_name
    network_security_group_resource_group_name = subnet.network_security_group_resource_group_name
    }] if lookup(subnet, "network_security_group_name", null) != null && lookup(subnet, "network_security_group_resource_group_name", null) != null
    ] if lookup(virtual_network, "subnets", null) != null
  ])
}

data "azurerm_network_security_group" "network_security_group" {
  for_each            = { for index, network_security_group in local.network_security_groups_list : "${network_security_group.virtual_network_key}-${network_security_group.subnet_name}-${network_security_group.network_security_group_name}" => network_security_group }
  name                = each.value.network_security_group_name
  resource_group_name = each.value.network_security_group_resource_group_name
}

resource "azurerm_virtual_network" "virtual_network" {
  for_each            = var.virtual_network_variables
  name                = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.resource_group_location
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = lookup(each.value, "subnets", null) != null ? toset(each.value.subnets) : []
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
      security_group   = lookup(subnet.value, "network_security_group_name", null) != null && lookup(subnet.value, "network_security_group_resource_group_name", null) != null ? data.azurerm_network_security_group.network_security_group.network_security_group["${each.key}-${subnet.value.name}-${subnet.value.network_security_group_name}"].id : []
    }
  }
  tags = each.value.tags
}
