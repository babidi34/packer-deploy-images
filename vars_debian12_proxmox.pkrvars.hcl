/*
boot_command = [
  "<esc><wait>auto console-keymaps-at/keymap=fr console-setup/ask_detect=false debconf/frontend=noninteractive fb=false url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>"
]
*/
boot_command = [
  "<esc><wait>auto console-keymaps-at/keymap=fr console-setup/ask_detect=false debconf/frontend=noninteractive fb=false url=http://192.168.1.166:{{ .HTTPPort }}/preseed.cfg<enter>"
]
cores = "1"
sockets = "1"
disk_size = "30G"
storage_pool = "local-lvm"
storage_pool_type = "scsi"
insecure_skip_tls_verify = true
format = "qcow2"
os = "l26"
http_directory = "http"
iso_checksum = "64d727dd5785ae5fcfd3ae8ffbede5f40cca96f1580aaa2820e8b99dae989d94"
iso_url = "https://cdimage.debian.org/cdimage/release/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso"
iso_storage_pool = "local"
iso_file = "local:iso/debian-12.4.0-amd64-netinst.iso"
memory = "1024"
ssh_password = "vagrant"
ssh_timeout = "30m"
ssh_username = "vagrant"
vm_name = "debian12-lvm"
provision_file_destination = "/tmp/"
provision_file_source = "id_ecdsa.pub"
provision_shell_script = "script_start.sh"
provision_shell_execute_command = "echo vagrant | sudo -S -E sh -c '{{ .Vars }} {{ .Path }}'"
provision_shell_pause_before = "10s"
provision_shell_timeout = "10s"
post_processor_keep_input_artifact = false
post_processor_provider_override = "virtualbox"
post_processor_output = "debian12-lvm.box"
network_bridge = "vmbr0"
network_model  = "virtio"
network_firewall = true
template_description = "Debian 12 lvm, generated on 30/03/2024"
template_name = "debian-12-lvm"
tags = "debian-12;template;lvm"