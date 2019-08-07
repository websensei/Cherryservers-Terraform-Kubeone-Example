# Cherryservers-Terraform-Kubermatic-Example
Terraform template to automatically deploy HA kubernetes cluster on Cherryservers infrastructure

# Requirements (tested)

- Golang 1.12.7
- Terraform 0.12


User-data is base64 encoded:

```sh
#cloud-init
packages:
 - curl
```

