# Cherryservers-Terraform-Kubermatic-Example

Terraform template to automatically deploy High-Available (HA) kubernetes cluster on Cherryservers infrastructure. 
This exmample will create HA cluster with three control plane nodes and three worker nodes.
Load balancing is powered by <http://gobetween.io/>

## Prerequisites

- Golang 1.12.7 <https://golang.org/dl/>
- Terraform 0.12.6 <https://www.terraform.io/downloads.html/>
- Cherryservers Terraform provider binary <http://downloads.cherryservers.com/other/terraform/>
- Kubeone <https://github.com/kubermatic/kubeone/>

## Setting Up 

You will cherrservers.com account with the credit in balance, which will be used to order services with hourly billing.

Create API key <https://portal.cherryservers.com/#/settings/api-keys/>
export it to variables.tf file:

```sh
provider "cherryservers" {
  auth_token = "amalkaad23asd4a8awd43a32e3492"
}
```

Other imporant variables:
-"team_id"
-"region" "EU-East-1"
-"plan_id"
-"private_key" & "public_key"

## How to use

```sh
terraform init
terraform apply -auto-approve
terraform output -json > tf.json
kubeone install config.yaml -t tf.json
```
