local k = import "1.18/main.libsonnet";
local kustomize = import 'kustomize-libsonnet/kustomize.libsonnet';

local deployment = k.apps.v1.deployment.new(name="foo", containers=[
  k.core.v1.container.new(name="foo", image="foo/bar")
]);

kustomize.nameSuffix('-prod')(deployment)