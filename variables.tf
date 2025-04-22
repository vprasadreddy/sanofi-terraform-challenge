variable "subscription_id" {
  type = string
}

variable "resource_group_variables" {
  type = map(object({
    resource_group_name     = string
    resource_group_location = string
    tags                    = optional(map(string))
  }))
}

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

variable "virtual_network_variables" {
  type = map(object({
    virtual_network_name    = string
    resource_group_name     = string
    resource_group_location = string
    address_space           = list(string)
    subnets = optional(list(object({
      name                                       = string
      address_prefixes                           = list(string)
      network_security_group_name                = optional(string)
      network_security_group_resource_group_name = optional(string)
    })))
    tags = optional(map(string))
  }))
}
