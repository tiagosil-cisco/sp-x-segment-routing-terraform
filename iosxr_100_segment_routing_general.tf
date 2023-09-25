resource "iosxr_segment_routing" "blocks" {
  for_each                 = local.sr_config_general
  device                   = each.key
  global_block_lower_bound = local.global_block_lower_bound
  global_block_upper_bound = local.global_block_upper_bound
  local_block_lower_bound  = local.local_block_lower_bound
  local_block_upper_bound  = local.local_block_upper_bound
}