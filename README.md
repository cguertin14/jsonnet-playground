# jsonnet-playground

Jsonnet playground meant to learn Jsonnet w/K8s.

## Prerequisites

- [Tanka](https://tanka.dev/install)
- [Jsonnet Bundler](https://github.com/jsonnet-bundler/jsonnet-bundler)
- [kubecfg](https://github.com/bitnami/kubecfg)

## How-tos

### Initialize the repository
This command will generate the `jsonnetfile.json`, where depencencies will be defined:
```console
$ tk init --k8s=false
...
```

### Add a new dependency

For example, to add the `k8s-alpha` library, execute the following command:
```console
$ jb install github.com/jsonnet-libs/k8s-alpha/1.18
...
```

### Show Jsonnet result

For example, with the `environments/nginx/main.jsonnet` file, you would run this command:
```console
$ tk show environments/nginx
apiVersion: v1
kind: Service
metadata:
  labels:
    name: nginx
  name: nginx
  namespace: default
spec:
  ports:
  - name: nginx-port
    port: 80
    targetPort: 80
  selector:
    name: nginx
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  namespace: default
spec:
  minReadySeconds: 10
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      name: nginx
  template:
    metadata:
      labels:
        name: nginx
    spec:
      containers:
      - image: nginx:latest
        imagePullPolicy: IfNotPresent
        name: nginx
        ports:
        - containerPort: 80
          name: port
```

## References/Guides

- [Tanka Tutorials](https://tanka.dev/tutorial/overview)
- [Tanka Apply](https://tanka.dev/output-filtering)
