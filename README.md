
# Packer Deploy Images

Ce projet utilise Packer pour créer automatiquement des images VirtualBox et Proxmox pour Debian. Actuellement les configurations sont prédéfinies pour Debian 10, Debian 11 et Debian 12, permettant une mise en place rapide et efficace de vos environnements de développement ou de production.

## Prérequis

- Packer
- Accès à un environnement VirtualBox ou Proxmox
- Clé SSH (vous aurez besoin de remplacer `id_ecdsa.pub` par votre clé publique SSH)

## Configuration de la clé SSH

Avant de lancer le build avec Packer, assurez-vous de remplacer `id_ecdsa.pub` par votre propre clé publique SSH. Cette étape est cruciale pour permettre l'accès sécurisé aux images générées.

## Sécurité et Mots de Passe

Les mots de passe pour les utilisateurs `root` et `vagrant` sont définis dans les fichiers de préconfiguration (`preseed`). **Pour des raisons de sécurité, il est fortement recommandé de changer ces mots de passe immédiatement après la création des machines virtuelles. Cela peut aussi être fait en modifiant le fichier script_start.sh**

## Build avec Packer

### Pour VirtualBox

Pour construire une image VirtualBox de base, utilisez la commande suivante :

```
packer build template-virtualbox.pkr.hcl
```

#### Debian 10

Pour construire spécifiquement une image Debian 10 pour VirtualBox :

```
packer build -var-file=vars_debian10.pkrvars.hcl template-virtualbox.pkr.hcl
```

#### Debian 11

Pour construire spécifiquement une image Debian 11 pour VirtualBox :

```
packer build -var-file=vars_debian11.pkrvars.hcl template-virtualbox.pkr.hcl
```

#### Debian 12

Pour construire spécifiquement une image Debian 12 pour VirtualBox :

```
packer build -var-file=vars_debian12.pkrvars.hcl template-virtualbox.pkr.hcl
```

### Pour Proxmox

#### Configuration des Variables Secrètes pour Proxmox

Pour utiliser les scripts Packer avec Proxmox, vous devez créer un fichier de variables secrètes nommé .secret-vars-proxmox.pkr.hcl. Ce fichier contiendra les informations nécessaires pour permettre à Packer de se connecter à votre environnement Proxmox. Voici le contenu à inclure dans ce fichier :

```hcl
node = "nom_de_la_node"
proxmox_url = "https://FQDN-ou-IP-PROXMOX:8006/api2/json"
username = "username node PVE"
password = "le-password"
```

Détails des variables :

    node : Le nom de votre node Proxmox.
    proxmox_url : L'URL pour accéder à l'API de Proxmox. Remplacez FQDN-ou-IP-PROXMOX par le nom de domaine complet ou l'adresse IP de votre serveur Proxmox suivi de :8006/api2/json.
    username : Le nom d'utilisateur utilisé pour se connecter à la node Proxmox.
    password : Le mot de passe associé à ce nom d'utilisateur.

Assurez-vous que ce fichier est correctement sécurisé et n'est pas accessible de manière inappropriée, car il contient des informations sensibles.

#### Debian 12

Pour construire une image Debian 12 pour Proxmox :

```
packer build -var-file=vars_debian12_proxmox.pkrvars.hcl -var-file=.secret-vars-proxmox.pkr.hcl template-proxmox.pkr.hcl
```

#### Debian 11

Pour construire une image Debian 11 pour Proxmox :

```
packer build -var-file=vars_debian11_proxmox.pkrvars.hcl -var-file=.secret-vars-proxmox.pkr.hcl template-proxmox.pkr.hcl
```

## Contribution

Les contributions au projet sont bienvenues. Vous pouvez créer une issue ou une pull request pour toute suggestion d'amélioration ou de correction.
