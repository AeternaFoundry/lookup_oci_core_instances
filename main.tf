data "oci_core_instances" "core_instances_lookup" {
  for_each = var.core_instances_lookup

  compartment_id          = each.value.compartment_id
  availability_domain     = each.value.availability_domain
  capacity_reservation_id = each.value.capacity_reservation_id
  compute_cluster_id      = each.value.compute_cluster_id
  display_name            = each.value.display_name
  state                   = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

