# Cherryservers-Terraform-Kubermatic-Example

Terraform template to automatically deploy High-Available (HA) kubernetes cluster on Cherryservers infrastructure. 
This exmample will create HA cluster with three control plane nodes and three worker nodes.

## Prerequisites

- Golang 1.12.7 <https://golang.org/dl/>
- Terraform 0.12.6 <https://www.terraform.io/downloads.html/>
- Cherryservers Terraform provider binary <http://downloads.cherryservers.com/other/terraform/>

And of course cherrservers.com account with the credit in balance, which will be used to order services with hourly billing.

Load balancing is powered by <http://gobetween.io/>

## Setting Up Credentials

Export cherryservers API key <https://portal.cherryservers.com/#/settings/api-keys/>

## User-data

User-data is base64 encoded:

```sh
#cloud-init
packages:
 - curl
```
