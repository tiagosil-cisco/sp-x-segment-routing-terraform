

resource "iosxr_router_isis_interface_address_family" "sr_index_ipv4" {
  depends_on = [ iosxr_router_isis_address_family.sr_isis_ipv4 ]
  delete_mode = "attributes"

  for_each = {
    for key, value in local.sr_config_general :
    key => value if value.protocol == "isis"
  }

  device         = each.key
  process_id     = local.isis_process_id
  interface_name = "Loopback${each.value.loopback_id}"
  af_name        = "ipv4"
  saf_name       = "unicast"
  prefix_sid_index = each.value.sr_index_ipv4
}


resource "iosxr_router_isis_interface_address_family" "sr_index_ipv6" {
  depends_on = [ iosxr_router_isis_address_family.sr_isis_ipv6 ]
  delete_mode = "attributes"

  for_each = {
    for key, value in local.sr_config_general :
    key => value if value.protocol == "isis"
  }

  device         = each.key
  process_id     = local.isis_process_id
  interface_name = "Loopback${each.value.loopback_id}"
  af_name        = "ipv6"
  saf_name       = "unicast"
  prefix_sid_index = each.value.sr_index_ipv6
}