packer {
    required_plugins {
      virtualbox = {
        source  = "github.com/hashicorp/virtualbox"
        version = "~> 1"
      }
      vagrant = {
        source  = "github.com/hashicorp/vagrant"
        version = "~> 1"
      }
    }
  }

variable "boot_command" {
    type    = list(string)
}

variable "cpus" {
    type    = string
    default = "1"
}

variable "disk_size" {
    type    = string
    default = "20000"
}

variable "format" {
    type    = string
    default = "ova"
}

variable "guest_additions_mode" {
    type    = string
}

variable "guest_os_type" {
    type    = string
}

variable "headless" {
    type    = bool
    default = true
}

variable "http_directory" {
    type    = string
}

variable "iso_checksum" {
    type    = string
}

variable "iso_url" {
    type    = string
}

variable "memory" {
    type    = string
    default = "1024"
}

variable "shutdown_command" {
    type    = string
}

variable "ssh_pass" {
    type    = string
    default = "vagrant"
}

variable "ssh_timeout" {
    type    = string
    default = "20m"
}

variable "ssh_user" {
    type    = string
    default = "vagrant"
}

variable "vm_name" {
    type    = string
}

variable "vboxmanage_nat" {
    type    = string
    default = "--nat-localhostreachable1"
}

variable "vboxmanage_on" {
    type    = string
    default = "on"
}

variable "provision_file_destination" {
    type    = string
}

variable "provision_file_source" {
    type    = string
}

variable "provision_shell_script" {
    type    = string
}

variable "post_processor_keep_input_artifact" {
    type    = bool
    default = false
}

variable "post_processor_provider_override" {
    type    = string
    default = "virtualbox"
}

variable "post_processor_output" {
    type    = string
}
  
source "virtualbox-iso" "debian" {
    boot_command            = var.boot_command
    cpus                    = var.cpus
    disk_size               = var.disk_size
    format                  = var.format
    guest_additions_mode    = var.guest_additions_mode
    guest_os_type           = var.guest_os_type
    headless                = var.headless
    http_directory          = var.http_directory
    iso_checksum            = var.iso_checksum
    iso_url                 = var.iso_url
    memory                  = var.memory
    ssh_password            = var.ssh_pass
    shutdown_command        = var.shutdown_command
    ssh_timeout             = var.ssh_timeout
    ssh_username            = var.ssh_user
    vm_name                 = var.vm_name
    vboxmanage              = [
        ["modifyvm", "{{ .Name }}", var.vboxmanage_nat, var.vboxmanage_on]
    ]
}
  
build {
    sources = ["source.virtualbox-iso.debian"]

    provisioner "file" {
        destination = var.provision_file_destination
        source = var.provision_file_source
    }

    provisioner "shell" {
        script = var.provision_shell_script
    }

    post-processor "vagrant" {
        keep_input_artifact = false
        provider_override = var.post_processor_provider_override
        output = var.post_processor_output
    }
}
  
  