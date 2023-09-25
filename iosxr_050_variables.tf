locals {
  project_title       = "SP-B"
  project_description = "Topology created using Terraform to represent SP-X"
  routers             = jsondecode(file("${path.module}/sp-x-devices.json"))
  sr_config_general   = jsondecode(file("${path.module}/sp-x-sr-general-config-variable.json"))
  isis_interfaces     = jsondecode(file("${path.module}/sp-x-isis-interfaces-variable.json"))


  xr_username = "admin"
  xr_password = "C!sco123"


  ospf_process_id = "1"
  isis_process_id = "CORE"
  // Segment-Routing config
  global_block_lower_bound = 16000
  global_block_upper_bound = 23999
  local_block_lower_bound  = 15000
  local_block_upper_bound  = 15999
}
