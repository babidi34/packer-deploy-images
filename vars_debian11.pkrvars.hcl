boot_command = [
  "<esc><wait>",
  "install <wait>",
  "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
  "debian-installer=en_US.UTF-8 <wait>",
  "auto <wait>",
  "locale=en_US.UTF-8 <wait>",
  "kbd-chooser/method=us <wait>",
  "keyboard-configuration/xkb-keymap=us <wait>",
  "netcfg/get_hostname={{ .Name }} <wait>",
  "netcfg/get_domain=local <wait>",
  "fb=false <wait>",
  "debconf/frontend=noninteractive <wait>",
  "console-setup/ask_detect=false <wait>",
  "console-keymaps-at/keymap=fr <wait>",
  "grub-installer/bootdev=/dev/sda <wait>",
  "<enter><wait>"
]
cpus = "1"
disk_size = "30000"
format = "ova"
guest_additions_mode = "upload"
guest_os_type = "Debian_64"
headless = true
http_directory = "http"
iso_checksum = "d7a74813a734083df30c8d35784926deaa36bc41e5c0766388e9f591ab056b72"
iso_url = "https://cdimage.debian.org/cdimage/archive/11.8.0/amd64/iso-cd/debian-11.8.0-amd64-netinst.iso"
memory = "1024"
ssh_pass = "vagrant"
shutdown_command = "echo vagrant | sudo -S shutdown -P now"
ssh_timeout = "30m"
ssh_user = "vagrant"
vm_name = "debian11-lvm"
vboxmanage_nat = "--nat-localhostreachable1"
vboxmanage_on = "on"
provision_file_destination = "/tmp/"
provision_file_source = "id_ecdsa.pub"
provision_shell_script = "script_start.sh"
provision_shell_execute_command = "echo vagrant | sudo -S -E sh -c '{{ .Vars }} {{ .Path }}'"
provision_shell_pause_before = "10s"
provision_shell_timeout = "10s"
post_processor_keep_input_artifact = false
post_processor_provider_override = "virtualbox"
post_processor_output = "debian11-lvm.box"
