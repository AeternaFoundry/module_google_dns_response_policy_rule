resource "google_dns_response_policy_rule" "dns_response_policy_rules" {
  for_each = var.dns_response_policy_rules

  dns_name        = each.value.dns_name
  response_policy = each.value.response_policy
  rule_name       = each.value.rule_name
  deletion_policy = each.value.deletion_policy
  project         = each.value.project

  dynamic "local_data" {
    for_each = each.value.local_data != null ? [each.value.local_data] : []
    content {
      dynamic "local_datas" {
        for_each = local_data.value.local_datas
        content {
          name    = local_datas.value.name
          rrdatas = local_datas.value.rrdatas
          ttl     = local_datas.value.ttl
          type    = local_datas.value.type
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

