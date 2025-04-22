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
