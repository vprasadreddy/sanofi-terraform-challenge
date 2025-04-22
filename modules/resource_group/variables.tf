variable "resource_group_variables" {
  type = map(object({
    resource_group_name     = string
    resource_group_location = string
    tags                    = optional(map(string))
  }))
}
