# Cherryservers Terraform Kubeone Example

Terraform template to automatically deploy High-Available (HA) Kubernetes cluster on Cherryservers infrastructure.
This example will create HA cluster with three control plane nodes.

Load balancing is powered by <http://gobetween.io/>

## Prerequisites

- [Golang](https://golang.org/dl/) 1.12.7
- [Terraform](https://www.terraform.io/downloads.html) 0.12.6
- [Cherryservers Terraform provider binary](http://downloads.cherryservers.com/other/terraform)
- [Kubeone](https://github.com/kubermatic/kubeone) v0.10.0-alpha.0

## Before you start

You will need [cherrservers.com](https://portal.cherryservers.com) account with the credit in balance, which will be used to order services with hourly billing.

Create API key <https://portal.cherryservers.com/#/settings/api-keys/>
and export it to variables.tf file:

```sh
provider "cherryservers" {
  auth_token = "amalkaad23asd4a8awd43a32e3492"
}
```

Other important variables:

- "team_id" can be optained once logged into [client portal](https://portal.cherryservers.com/#/)
- "region" default is "EU-East-1". "EU-West-1" supports only Bare-metal [E5-1620v4](https://www.cherryservers.com/pricing/bare-metal-cloud-servers/e5-1620v4)
- "lb_plan_id" default is "59" [SSD Smart8](https://www.cherryservers.com/pricing/virtual-servers/ssd_smart8)
- "node_plan_id" default is "96" [SSD Smart16](https://www.cherryservers.com/pricing/virtual-servers/ssd_smart16), all plans are available [here](https://api.cherryservers.com/v1/plans?currency=EUR)
- "private_key" & "public_key" are your private and public SSH keys needed for the deployment

## Kubernetes version

You can define required Kubernetes version at "config.yaml" file. The default is "v1.14", but latest now is "v1.15".

## How to use

```sh
terraform init
terraform apply -auto-approve
terraform output -json > tf.json
kubeone install config.yaml -t tf.json
```

If you get no errors here then you have succesfully have created HA kubernetes cluster.

## Control remote Kubernetes cluster locally

Make sure you have installed [Kubernetes CLI tools](https://kubernetes.io/docs/tasks/tools/install-kubectl/) localy.

```sh
kubectl version
```

Copy kubernetes cluster config to local workstation

```sh
scp -r -i ~/.ssh/deployment root@control_plane_ip:/root/.kube $HOME
```

Replace "control_plane_ip" with the one of nodes public IP.

```sh
kubectl get nodes
kubectl describe nodes
```

## Web UI (Dashboard)

The Dashboard UI is not deployed by default. To deploy Kubernetes Dashboard go [here](https://github.com/websensei/Cherryservers-Terraform-Kubeone-Example/tree/master/dashboard)
