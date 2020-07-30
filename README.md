# jsonnet-playground

Jsonnet playground meant to learn Jsonnet w/K8s.

## Prerequisites

- [jb](https://github.com/jsonnet-bundler/jsonnet-bundler)
- [kubecfg](https://github.com/bitnami/kubecfg)

## How-tos

### Initialize the repository
This command will generate the `jsonnetfile.json`, where depencencies will be defined:
```console
$ jb init
...
```

### Add a new dependency

For example, to add the `k8s-alpha` library, execute the following command:
```console
$ jb install github.com/jsonnet-libs/k8s-alpha/1.18
...
```
