# Web UI (Dashboard)

Dashboard is a web-based Kubernetes user interface.

Run the commands in the following order:

### Deploy the Dashboard UI

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta1/aio/deploy/recommended.yaml
```

### Create Admin Service Account

```sh
kubectl apply -f dashboard-adminuser.yml
kubectl apply -f admin-role-binding.yml
```

### Get access token

```sh
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
```

## Access Web UI (Dashboard)

The UI can only be accessed from the machine where the command is executed:

```sh
kubectl proxy
```

Kubectl will make Dashboard available at http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
