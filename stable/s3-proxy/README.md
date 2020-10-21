# s3-proxy

[s3-proxy](https://github.com/oxyno-zeta/s3-proxy) is a S3 proxy with multi bucket support, OIDC authentication, basic auth, ...

## TL;DR;

```console
$ helm repo add oxynozeta-stable https://oxyno-zeta.github.io/helm-charts/stable/
$ helm install oxynozeta-stable/s3-proxy
```

## Introduction

This chart bootstraps a s3-proxy deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install oxynozeta-stable/s3-proxy --name my-release
```

The command deploys s3-proxy on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the s3-proxy chart and their default values.

| Parameter                                     | Description                                                                                                                                                | Default                  |
| --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `replicaCount`                                | Desired number of pods                                                                                                                                     | `1`                      |
| `image.name`                                  | Container image name (Including repository name if not `hub.docker.com`).                                                                                  | `oxynozeta/s3-proxy`     |
| `image.pullPolicy`                            | Container pull policy.                                                                                                                                     | `IfNotPresent`           |
| `image.tag`                                   | Container image tag.                                                                                                                                       | `3.0.3`                  |
| `nameOverride`                                | Name override                                                                                                                                              | `""`                     |
| `fullnameOverride`                            | Fullname override                                                                                                                                          | `""`                     |
| `service.annotations`                         | Annotations to add to service                                                                                                                              | `{}`                     |
| `service.clusterIP`                           | IP address to assign to service                                                                                                                            | `""`                     |
| `service.externalIPs`                         | Service external IP addresses                                                                                                                              | `[]`                     |
| `service.loadBalancerIP`                      | IP address to assign to load balancer (if supported)                                                                                                       | `""`                     |
| `service.loadBalancerSourceRanges`            | List of IP CIDRs allowed access to load balancer (if supported)                                                                                            | `[]`                     |
| `service.port`                                | Service port to expose                                                                                                                                     | `80`                     |
| `service.type`                                | Type of service to create                                                                                                                                  | `ClusterIP`              |
| `ingress.enabled`                             | Enables Ingress                                                                                                                                            | `false`                  |
| `ingress.annotations`                         | Ingress annotations                                                                                                                                        | `{}`                     |
| `ingress.hosts`                               | Ingress accepted hostnames                                                                                                                                 | `[]`                     |
| `ingress.tls`                                 | Ingress TLS configuration                                                                                                                                  | `[]`                     |
| `customTemplates`                             | S3 Proxy custom templates files (mounted in /custom-templates)                                                                                             | `{}`                     |
| `secretFiles`                                 | Secret files for secrets declaration and usage                                                                                                             | `{}`                     |
| `env`                                         | Environment variables                                                                                                                                      | `{}`                     |
| `configFiles`                                      | [S3 proxy configuration](https://oxyno-zeta.github.io/s3-proxy/#configuration) files)                                                                                           | Example of configuration |
| `resources`                                   | CPU/Memory resource requests/limits.                                                                                                                       | `{}`                     |
| `nodeSelector`                                | Node labels for pod assignment                                                                                                                             | `{}`                     |
| `tolerations`                                 | List of node taints to tolerate (requires Kubernetes >= 1.6)                                                                                               | `[]`                     |
| `affinity`                                    | List of affinities (requires Kubernetes >=1.6)                                                                                                             | `{}`                     |
| `livenessProbe`                               | Liveness probe settings for logstash container                                                                                                             | (see `values.yaml`)      |
| `readinessProbe`                              | Readiness probe settings for logstash container                                                                                                            | (see `values.yaml`)      |
| `prometheus.serviceMonitor.enabled`           | If true, a ServiceMonitor CRD is created for a prometheus operator                                                                                         | `false`                  |
| `prometheus.serviceMonitor.namespace`         | If set, the ServiceMonitor will be installed in a different namespace                                                                                      | `""`                     |
| `prometheus.serviceMonitor.labels`            | Labels for prometheus operator                                                                                                                             | `{}`                     |
| `prometheus.serviceMonitor.interval`          | Interval at which metrics should be scraped                                                                                                                | `""`                     |
| `prometheus.serviceMonitor.scrapeTimeout`     | Timeout after which the scrape is ended                                                                                                                    | `""`                     |
| `prometheus.serviceMonitor.scheme`            | Scheme to use for scraping                                                                                                                                 | `http`                   |
| `prometheus.serviceMonitor.metricRelabelings` | Metric relabelings                                                                                                                                         | `[]`                     |
| `prometheus.serviceMonitor.relabelings`       | Relabelings                                                                                                                                                | `[]`                     |
| `podAnnotations`                              | Additional annotations to apply to the pod.                                                                                                                | `{}`                     |
| `grafana.operator.enabled` | If true, create a GrafanaDashboard custom resource using the CRD from [grafana-operator](https://github.com/integr8ly/grafana-operator). | `false` |
| `grafana.operator.labels` | Extra labels for selector | `{}` |
| `grafana.configmap.enabled` | If true, create a ConfigMap resource compatible with the Grafana sidecar from kiwigrid/k8s-sidecar. | `false` |
| `grafana.configmap.labels` | Extra labels for selector | `{}` |
| `podDisruptionBudget.enabled`                 | If true, create a pod disruption budget for prometheus pods. The created resource cannot be modified once created - it must be deleted to perform a change | `false`                  |
| `podDisruptionBudget.minAvailable`            | Minimum number / percentage of pods that should remain scheduled                                                                                           | `1`                      |
| `podDisruptionBudget.maxUnavailable`          | Maximum number / percentage of pods that may be made unavailable                                                                                           | `""`                     |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install oxynozeta-stable/s3-proxy --name my-release --set=image.tag="XXXXXXX"
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install oxynozeta-stable/s3-proxy --name my-release -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)
