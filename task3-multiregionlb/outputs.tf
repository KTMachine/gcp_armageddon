# Load Balancer IP Address
output "load_balancer_ip" {
  value = google_compute_global_forwarding_rule.entry_point.ip_address
  description = "IP of the load balancer"
}

# Windows RDP IP Address
output "rdp_ip" {
  value = google_compute_instance.iowa-windows-vm.network_interface[0].access_config[0].nat_ip
  description = "RDP IP of the Windows VM"
}