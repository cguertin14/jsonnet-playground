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

For example, with the `environments/default/main.jsonnet` file, you would run this command:
```console
$ tk show environments/default
apiVersion: apps/v1
kind: Deployment
metadata:
  name: foo-prod
  namespace: default
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: name
    spec:
      containers:
      - image: foo/bar
        name: foo
```

## References/Guides

- [Tanka Tutorials](https://tanka.dev/tutorial/overview)
- [Tanka apply](https://tanka.dev/output-filtering)
