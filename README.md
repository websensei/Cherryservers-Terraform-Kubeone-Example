# Cherryservers-Terraform-Kubeone-Example

Terraform template to automatically deploy High-Available (HA) kubernetes cluster on Cherryservers infrastructure. 
This example will create HA cluster with three control plane nodes.
Load balancing is powered by <http://gobetween.io/>

## Prerequisites

- [Golang](https://golang.org/dl/)
- [Terraform](https://www.terraform.io/downloads.html) 0.12.6
- [Cherryservers Terraform provider binary](http://downloads.cherryservers.com/other/terraform)
- [Kubeone](https://github.com/kubermatic/kubeone)

## Before you start

You will need [cherrservers.com](https://portal.cherryservers.com) account with the credit in balance, which will be used to order services with hourly billing.

Create API key <https://portal.cherryservers.com/#/settings/api-keys/>
export it to variables.tf file:

```sh
provider "cherryservers" {
  auth_token = "amalkaad23asd4a8awd43a32e3492"
}
```

Other important variables:

- "team_id" can be optained once logged into [client portal](https://portal.cherryservers.com/#/)
- "region" default is "EU-East-1"
- "plan_id" default is "96" [SSD Smart16](https://www.cherryservers.com/pricing/virtual-servers/ssd_smart16), all plans are available [here](https://api.cherryservers.com/v1/plans?currency=EUR) 
- "private_key" & "public_key" are your private and public SSH keys needed for the deployment

## How to use

```sh
terraform init
terraform apply -auto-approve
terraform output -json > tf.json
kubeone install config.yaml -t tf.json
```
