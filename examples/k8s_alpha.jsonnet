// local k8s = import "../vendor/1.18/main.libsonnet";
// local kustomize = import '../vendor/kustomize-libsonnet/kustomize.libsonnet';

local k8s = import "1.18/main.libsonnet";
local kustomize = import 'kustomize-libsonnet/kustomize.libsonnet';

local deployment = k8s.apps.v1.deployment.new(name="foo", containers=[
  k8s.core.v1.container.new(name="foo", image="foo/bar")
]);

// deployment

kustomize.nameSuffix('-prod')(deployment)