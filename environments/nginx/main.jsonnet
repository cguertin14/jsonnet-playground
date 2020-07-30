(import "ksonnet-util/kausal.libsonnet") +
{
  _config:: {
    nginx: {
      port: 80,
      name: "nginx"
    },
  },

  local deployment = $.apps.v1.deployment,
  local container = $.core.v1.container,
  local port = $.core.v1.containerPort,
  local service = $.core.v1.service,

  nginx: {
    deployment: deployment.new(
      name=$._config.nginx.name,
      replicas=1,
      containers=[
        container.new(
          image=$._config.nginx.name + ":latest",
          name=$._config.nginx.name
        ) + container.withPorts([port.new("port", $._config.nginx.port)]),
      ]
    ),
    service: $.util.serviceFor(self.deployment)
  }
}