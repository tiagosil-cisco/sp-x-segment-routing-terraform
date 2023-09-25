resource "iosxr_router_isis_address_family" "sr_isis_ipv4" {
  delete_mode = "attributes"
  for_each = {
    for key, value in local.sr_config_general :
    key => value if value.protocol == "isis"
  }
  device                         = each.key
  process_id                     = local.isis_process_id
  af_name                        = "ipv4"
  saf_name                       = "unicast"
  segment_routing_mpls_sr_prefer = true
}


resource "iosxr_router_isis_address_family" "sr_isis_ipv6" {
  delete_mode = "attributes"
  for_each = {
    for key, value in local.sr_config_general :
    key => value if value.protocol == "isis"
  }
  device                         = each.key
  process_id                     = local.isis_process_id
  af_name                        = "ipv6"
  saf_name                       = "unicast"
  segment_routing_mpls_sr_prefer = true
}


