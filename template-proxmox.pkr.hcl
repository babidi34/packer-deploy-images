packer {
    required_plugins {
        proxmox = {
            source  = "github.com/hashicorp/proxmox"
            version = "~> 1"
        }
    }
}

variable "proxmox_url" {
    type    = string
}
variable "node" {
    type    = string
}
variable "username" {
    type    = string
    default = "root@pam" 
}
variable "password" {
    type    = string
    sensitive = true
}
variable "vm_name" {
    type    = string
}
variable "iso_url" {
    type    = string
}
variable "iso_file" {
    type    = string
    default = ""
}
variable "iso_checksum" {
    type    = string
}
variable "ssh_username" {
    type    = string
    default = "vagrant"
}
variable "ssh_password" {
    type    = string
    default = "vagrant"
    sensitive = true
}
variable "os" {
    type    = string
    default = "l26"
}
variable "iso_storage_pool" {
    type    = string
}
variable "storage_pool_type" {
    type    = string
}
variable "storage_pool" {
    type    = string
}
variable "disk_size" {
    type    = string
    default = "20000"
}
variable "memory" {
    type    = number
    default = "1024"
}
variable "cores" {
    type    = string
    default = "1"
}
variable "sockets" {
    type    = string
    default = "1"
}

variable "http_directory" {
    type    = string
}
variable "boot_wait" {
    type    = string
    default = "10s"
}
variable "ssh_timeout" {
    type    = string
    default = "20m"
}

variable "format" {
    type    = string
    default = "raw"
}

variable "insecure_skip_tls_verify" {
    type    = bool
    default = false
}

variable "template_description" {
    type    = string
    default = ""
}

variable "template_name" {
    type = string
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

variable "provision_shell_execute_command" {
    type    = string
}

variable "network_model" {
    type    = string
    default = "virtio"
}

variable "network_bridge" {
    type    = string
    default = "vmbr0"
}

variable "network_firewall" {
    type    = bool
    default = false
}

variable "boot_command" {
    type    = list(string)
}

variable "tags" {
    type    = string
    default = "template"
}

locals {
  packer_timestamp = formatdate("YYYYMMDD-hhmm", timestamp())
}

source "proxmox-iso" "debian" {
    boot_command = var.boot_command
    boot_wait    = var.boot_wait
    disks {
        disk_size         = var.disk_size
        storage_pool      = var.storage_pool
        type              = var.storage_pool_type
    }
    efi_config {
        efi_storage_pool  =  var.storage_pool
        efi_type          = "4m"
        pre_enrolled_keys = true
    }
    http_directory           = var.http_directory
    insecure_skip_tls_verify = var.insecure_skip_tls_verify
    iso_file                 = var.iso_file
    iso_url                  = var.iso_url
    iso_checksum             = var.iso_checksum
    iso_storage_pool         = var.iso_storage_pool
    network_adapters         {
            model   = var.network_model
            bridge  = var.network_bridge
            firewall = var.network_firewall
        }
    node                 = var.node
    password             = var.password
    proxmox_url          = var.proxmox_url
    ssh_password         = var.ssh_password
    ssh_timeout          = var.ssh_timeout
    ssh_username         = var.ssh_username
    template_description = "${var.template_description} - ${local.packer_timestamp}"
    template_name        = var.template_name
    unmount_iso          = true
    username             = var.username
    tags                 = var.tags

    }
  
build {
    sources = ["source.proxmox-iso.debian"]

    provisioner "file" {
        destination = var.provision_file_destination
        source = var.provision_file_source
    }

    provisioner "shell" {
        script = var.provision_shell_script
        execute_command = var.provision_shell_execute_command
    }
}
  
  