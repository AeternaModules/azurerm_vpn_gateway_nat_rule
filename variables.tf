variable "vpn_gateway_nat_rules" {
  description = <<EOT
Map of vpn_gateway_nat_rules, attributes below
Required:
    - name
    - vpn_gateway_id
Optional:
    - ip_configuration_id
    - mode
    - type
    - external_mapping (block):
        - address_space (required)
        - port_range (optional)
    - internal_mapping (block):
        - address_space (required)
        - port_range (optional)
EOT

  type = map(object({
    name                = string
    vpn_gateway_id      = string
    ip_configuration_id = optional(string)
    mode                = optional(string)
    type                = optional(string)
    external_mapping = optional(list(object({
      address_space = string
      port_range    = optional(string)
    })))
    internal_mapping = optional(list(object({
      address_space = string
      port_range    = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateway_nat_rules : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateway_nat_rules : (
        v.external_mapping == null || alltrue([for item in v.external_mapping : (item.port_range == null || (length(item.port_range) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateway_nat_rules : (
        v.internal_mapping == null || alltrue([for item in v.internal_mapping : (item.port_range == null || (length(item.port_range) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateway_nat_rules : (
        v.ip_configuration_id == null || (contains(["Instance0", "Instance1"], v.ip_configuration_id))
      )
    ])
    error_message = "must be one of: Instance0, Instance1"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

