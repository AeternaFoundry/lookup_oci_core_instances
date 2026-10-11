variable "core_instances_lookup" {
  description = <<EOT
Map of core_instances_lookup, attributes below
Required:
    - compartment_id
Optional:
    - availability_domain
    - capacity_reservation_id
    - compute_cluster_id
    - display_name
    - state
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id          = string
    availability_domain     = optional(string)
    capacity_reservation_id = optional(string)
    compute_cluster_id      = optional(string)
    display_name            = optional(string)
    state                   = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

