

resource "iosxr_router_isis_interface_address_family" "ipv4_ti_lfa" {
  depends_on = [ iosxr_router_isis_address_family.sr_isis_ipv4 ]
delete_mode = "attributes"
  for_each = {
    for key, value in local.isis_interfaces :
    key => value if value.address_family_ipv4 == "true" && value.interface_id != "Loopback0"
  }

  device         = each.value.device
  process_id     = each.value.process_id
  interface_name = each.value.interface_id
  af_name        = "ipv4"
  saf_name       = "unicast"

  fast_reroute_per_prefix_levels = [
    {
      level_id = each.value.af_ipv4_metric_level
      ti_lfa   = true
    }
  ]
}




resource "iosxr_router_isis_interface_address_family" "ipv6_ti_lfa" {
    depends_on = [ iosxr_router_isis_address_family.sr_isis_ipv6 ]

delete_mode = "attributes"
  for_each = {
    for key, value in local.isis_interfaces :
    key => value if value.address_family_ipv6 == "true" && value.interface_id != "Loopback0"
  }

  device         = each.value.device
  process_id     = each.value.process_id
  interface_name = each.value.interface_id
  af_name        = "ipv6"
  saf_name       = "unicast"

  fast_reroute_per_prefix_levels = [
    {
      level_id = each.value.af_ipv4_metric_level
      ti_lfa   = true
    }
  ]
}
