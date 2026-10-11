output "dns_response_policy_rules_id" {
  description = "Map of id values across all dns_response_policy_rules, keyed the same as var.dns_response_policy_rules except keys with no id are omitted"
  value       = { for k, v in google_dns_response_policy_rule.dns_response_policy_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dns_response_policy_rules_deletion_policy" {
  description = "Map of deletion_policy values across all dns_response_policy_rules, keyed the same as var.dns_response_policy_rules except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dns_response_policy_rule.dns_response_policy_rules : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dns_response_policy_rules_dns_name" {
  description = "Map of dns_name values across all dns_response_policy_rules, keyed the same as var.dns_response_policy_rules except keys with no dns_name are omitted"
  value       = { for k, v in google_dns_response_policy_rule.dns_response_policy_rules : k => v.dns_name if v.dns_name != null && length(v.dns_name) > 0 }
}
output "dns_response_policy_rules_local_data" {
  description = "Map of local_data values across all dns_response_policy_rules, keyed the same as var.dns_response_policy_rules except keys with no local_data are omitted"
  value       = { for k, v in google_dns_response_policy_rule.dns_response_policy_rules : k => one(v.local_data) if v.local_data != null && length(v.local_data) > 0 }
}
output "dns_response_policy_rules_project" {
  description = "Map of project values across all dns_response_policy_rules, keyed the same as var.dns_response_policy_rules except keys with no project are omitted"
  value       = { for k, v in google_dns_response_policy_rule.dns_response_policy_rules : k => v.project if v.project != null && length(v.project) > 0 }
}
output "dns_response_policy_rules_response_policy" {
  description = "Map of response_policy values across all dns_response_policy_rules, keyed the same as var.dns_response_policy_rules except keys with no response_policy are omitted"
  value       = { for k, v in google_dns_response_policy_rule.dns_response_policy_rules : k => v.response_policy if v.response_policy != null && length(v.response_policy) > 0 }
}
output "dns_response_policy_rules_rule_name" {
  description = "Map of rule_name values across all dns_response_policy_rules, keyed the same as var.dns_response_policy_rules except keys with no rule_name are omitted"
  value       = { for k, v in google_dns_response_policy_rule.dns_response_policy_rules : k => v.rule_name if v.rule_name != null && length(v.rule_name) > 0 }
}

