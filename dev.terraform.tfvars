subscription_id = "78fff76a-cacd-420d-a76e-9ef47b4f29d1"
resource_group_variables = {
    "resource-group-1" = {
    resource_group_name     = "sanofi-proj-rg-dev-01"
    resource_group_location = "eastus" 
    tags = {
        PROJECT = "SANOFI-OPELLA"
        Created_By = "VARA PRASAD REDDY"
        CreatedBy = "VARA PRASAD REDDY"
        Owner = "varaprasad.reddy@neudesic.com"
    }
},
    "resource-group-2" = {
    resource_group_name     = "sanofi-proj-rg-dev-02"
    resource_group_location = "eastus" 
    tags = {
        PROJECT = "SANOFI-OPELLA"
        Created_By = "VARA PRASAD REDDY"
        CreatedBy = "VARA PRASAD REDDY"
        Owner = "varaprasad.reddy@neudesic.com"
    }  
}
}

network_security_group_variables = {
   "network-security-group-1" = {
    name                    = "sanofi-proj-nsg-dev-01"
    resource_group_name     = "sanofi-proj-rg-dev-01"
    resource_group_location = "eastus"
    security_rule = [{
      name                       = "port-3389"
      description                = "Allow Inbound Port 3389"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "*"
      priority                   = 100
      direction                  = "*"
    },
    {
      name                       = "port-22"
      description                = "Allow Inbound Port 22"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "*"
      priority                   = 101
      direction                  = "*"
    }
    ]
     tags = {
        PROJECT = "SANOFI-OPELLA"
        Created_By = "VARA PRASAD REDDY"
        CreatedBy = "VARA PRASAD REDDY"
        Owner = "varaprasad.reddy@neudesic.com"
    }
}
}

virtual_network_variables = {
    "virtual-network-1" = {
    virtual_network_name    = "sanofi-proj-vnet-dev-01"
    resource_group_name     = "sanofi-proj-rg-dev-01"
    resource_group_location = "eastus"
    address_space           = ["10.0.0.0/16"]
    subnets = [{
      name                                       = "vnet-dev-01-app-subnet"
      address_prefixes                           = ["10.0.1.0/24"]
      network_security_group_name                = "sanofi-proj-nsg-dev-01"
      network_security_group_resource_group_name = "sanofi-proj-rg-dev-01"
    },
    {
      name                                       = "vnet-dev-01-db-subnet"
      address_prefixes                           = ["10.0.2.0/24"]
      network_security_group_name                = null
      network_security_group_resource_group_name = null
    }
    ]
    tags = {
        PROJECT = "SANOFI-OPELLA"
        Created_By = "VARA PRASAD REDDY"
        CreatedBy = "VARA PRASAD REDDY"
        Owner = "varaprasad.reddy@neudesic.com"
    }
  },
    "virtual-network-2" = {
    virtual_network_name    = "sanofi-proj-vnet-dev-02"
    resource_group_name     = "sanofi-proj-rg-dev-02"
    resource_group_location = "eastus"
    address_space           = ["11.0.0.0/16"]
    subnets = [{
      name                                       = "vnet-dev-02-microservices-subnet"
      address_prefixes                           = ["11.0.0.0/32"]
      network_security_group_name                = null
      network_security_group_resource_group_name = null
    }]
    tags = {
        PROJECT = "SANOFI-OPELLA"
        Created_By = "VARA PRASAD REDDY"
        CreatedBy = "VARA PRASAD REDDY"
        Owner = "varaprasad.reddy@neudesic.com"
    }
  }
}






