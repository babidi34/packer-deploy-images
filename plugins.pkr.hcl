packer {
    required_plugins {
        virtualbox = {
          version = "~> 1"
          source  = "github.com/hashicorp/virtualbox"
        }
        proxmox = {
            source  = "github.com/hashicorp/proxmox"
            version = "~> 1"
        }
    }
}