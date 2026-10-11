variable "dns_response_policy_rules" {
  description = <<EOT
Map of dns_response_policy_rules, attributes below
Required:
    - dns_name
    - response_policy
    - rule_name
Optional:
    - deletion_policy
    - project
    - local_data (block):
        - local_datas (required, block):
            - name (required)
            - rrdatas (optional)
            - ttl (optional)
            - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    dns_name        = string
    response_policy = string
    rule_name       = string
    deletion_policy = optional(string)
    project         = optional(string)
    local_data = optional(object({
      local_datas = list(object({
        name    = string
        rrdatas = optional(list(string))
        ttl     = optional(number)
        type    = string
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dns_response_policy_rules : (
        v.local_data == null || (length(v.local_data.local_datas) >= 1)
      )
    ])
    error_message = "Each local_datas list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

