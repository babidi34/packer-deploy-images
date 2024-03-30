# Commands

## build virtualbox

 packer build virtualbox-debian10.json

### debian 10

 packer build -var-file=vars_debian10.pkrvars.hcl template-virtualbox.pkr.hcl

## build proxmox

 packer build -var-file=vars_debian12_proxmox.pkrvars.hcl -var-file=.secret-vars-proxmox.pkr.hcl template-proxmox.pkr.hcl