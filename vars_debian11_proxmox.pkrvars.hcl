/*
boot_command = [
  "<esc><wait>auto console-keymaps-at/keymap=fr console-setup/ask_detect=false debconf/frontend=noninteractive fb=false url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>"
]
*/
boot_command = [
  "<esc><wait>auto console-keymaps-at/keymap=fr console-setup/ask_detect=false debconf/frontend=noninteractive fb=false url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>"
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
iso_checksum = "d7a74813a734083df30c8d35784926deaa36bc41e5c0766388e9f591ab056b72"
iso_url = "https://cdimage.debian.org/cdimage/archive/11.8.0/amd64/iso-cd/debian-11.8.0-amd64-netinst.iso"
iso_storage_pool = "local"
#iso_file = "local:iso/debian-11.4.0-amd64-netinst.iso"
memory = "1024"
ssh_password = "vagrant"
ssh_timeout = "30m"
ssh_username = "vagrant"
vm_name = "debian11-lvm"
provision_file_destination = "/tmp/"
provision_file_source = "id_ecdsa.pub"
provision_shell_script = "script_start.sh"
provision_shell_execute_command = "echo vagrant | sudo -S -E sh -c '{{ .Vars }} {{ .Path }}'"
provision_shell_pause_before = "10s"
provision_shell_timeout = "10s"
post_processor_keep_input_artifact = false
post_processor_provider_override = "virtualbox"
post_processor_output = "debian11-lvm.box"
network_bridge = "vmbr0"
network_model  = "virtio"
network_firewall = true
template_description = "Debian 11 lvm"
template_name = "debian-11-lvm"
tags = "debian-11;template;lvm"