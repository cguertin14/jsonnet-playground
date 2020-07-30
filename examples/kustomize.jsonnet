local kustomize = import 'kustomize-libsonnet/kustomize.libsonnet';

local my_resource = {
  metadata: {
    name: 'my-resource',
  },
};

kustomize.namePrefix('staging-')(my_resource)