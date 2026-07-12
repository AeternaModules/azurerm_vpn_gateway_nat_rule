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
    external_mapping = optional(list(object({
      address_space = string
      port_range    = optional(string)
    })))
    internal_mapping = optional(list(object({
      address_space = string
      port_range    = optional(string)
    })))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_vpn_gateway_nat_rule's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: vpn_gateway_id
  #   source:    [from virtualwans.ValidateVpnGatewayID] !ok
  # path: vpn_gateway_id
  #   source:    [from virtualwans.ValidateVpnGatewayID] err != nil
  # path: external_mapping.address_space
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
  # path: external_mapping.port_range
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: internal_mapping.address_space
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
  # path: internal_mapping.port_range
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: ip_configuration_id
  #   condition: contains(["Instance0", "Instance1"], value)
  #   message:   must be one of: Instance0, Instance1
  # path: mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

