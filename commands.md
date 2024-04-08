# Commands

## build virtualbox

 packer build template-virtualbox.pkr.hcl

### debian 10

 packer build -var-file=vars_debian10.pkrvars.hcl template-virtualbox.pkr.hcl

## build proxmox

### debian 12

 packer build -var-file=vars_debian12_proxmox.pkrvars.hcl -var-file=.secret-vars-proxmox.pkr.hcl template-proxmox.pkr.hcl

### debian 11

packer build -var-file=vars_debian11_proxmox.pkrvars.hcl -var-file=.secret-vars-proxmox.pkr.hcl template-proxmox.pkr.hcl