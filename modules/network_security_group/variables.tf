variable "network_security_group_variables" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    resource_group_location = string
    security_rule = optional(list(object({
      name                       = string
      description                = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = number
      direction                  = string
    })))
    tags = optional(map(string))
  }))
}
