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
    mode                = optional(string) # Default: "EgressSnat"
    type                = optional(string) # Default: "Static"
    external_mapping = optional(object({
      address_space = string
      port_range    = optional(string)
    }))
    internal_mapping = optional(object({
      address_space = string
      port_range    = optional(string)
    }))
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
        v.external_mapping == null || (v.external_mapping.port_range == null || (length(v.external_mapping.port_range) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_gateway_nat_rules : (
        v.internal_mapping == null || (v.internal_mapping.port_range == null || (length(v.internal_mapping.port_range) > 0))
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
  # --- Unconfirmed validation candidates, derived from azurerm_vpn_gateway_nat_rule's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: vpn_gateway_id
  #   source:    [from virtualwans.ValidateVpnGatewayID] !ok
  # path: vpn_gateway_id
  #   source:    [from virtualwans.ValidateVpnGatewayID] err != nil
  # path: external_mapping.address_space
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
  # path: internal_mapping.address_space
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
  # path: mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

