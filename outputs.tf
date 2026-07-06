output "vpn_gateway_nat_rules" {
  description = "All vpn_gateway_nat_rule resources"
  value       = azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules
}
output "vpn_gateway_nat_rules_external_mapping" {
  description = "List of external_mapping values across all vpn_gateway_nat_rules"
  value       = [for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : v.external_mapping]
}
output "vpn_gateway_nat_rules_internal_mapping" {
  description = "List of internal_mapping values across all vpn_gateway_nat_rules"
  value       = [for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : v.internal_mapping]
}
output "vpn_gateway_nat_rules_ip_configuration_id" {
  description = "List of ip_configuration_id values across all vpn_gateway_nat_rules"
  value       = [for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : v.ip_configuration_id]
}
output "vpn_gateway_nat_rules_mode" {
  description = "List of mode values across all vpn_gateway_nat_rules"
  value       = [for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : v.mode]
}
output "vpn_gateway_nat_rules_name" {
  description = "List of name values across all vpn_gateway_nat_rules"
  value       = [for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : v.name]
}
output "vpn_gateway_nat_rules_type" {
  description = "List of type values across all vpn_gateway_nat_rules"
  value       = [for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : v.type]
}
output "vpn_gateway_nat_rules_vpn_gateway_id" {
  description = "List of vpn_gateway_id values across all vpn_gateway_nat_rules"
  value       = [for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : v.vpn_gateway_id]
}

