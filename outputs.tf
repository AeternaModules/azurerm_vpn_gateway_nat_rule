output "vpn_gateway_nat_rules_id" {
  description = "Map of id values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.id }
}
output "vpn_gateway_nat_rules_external_mapping" {
  description = "Map of external_mapping values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.external_mapping }
}
output "vpn_gateway_nat_rules_internal_mapping" {
  description = "Map of internal_mapping values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.internal_mapping }
}
output "vpn_gateway_nat_rules_ip_configuration_id" {
  description = "Map of ip_configuration_id values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.ip_configuration_id }
}
output "vpn_gateway_nat_rules_mode" {
  description = "Map of mode values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.mode }
}
output "vpn_gateway_nat_rules_name" {
  description = "Map of name values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.name }
}
output "vpn_gateway_nat_rules_type" {
  description = "Map of type values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.type }
}
output "vpn_gateway_nat_rules_vpn_gateway_id" {
  description = "Map of vpn_gateway_id values across all vpn_gateway_nat_rules, keyed the same as var.vpn_gateway_nat_rules"
  value       = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rules : k => v.vpn_gateway_id }
}

