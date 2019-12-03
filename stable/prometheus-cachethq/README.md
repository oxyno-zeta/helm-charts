# prometheus-cachethq

[prometheus-cachethq](https://github.com/oxyno-zeta/prometheus-cachethq) is a Prometheus Alertmanager webhook to CachetHQ.

## TL;DR;

```console
$ helm repo add oxynozeta-stable https://oxyno-zeta.github.io/helm-charts/stable/
$ helm install oxynozeta-stable/prometheus-cachethq
```

## Introduction

This chart bootstraps a prometheus-cachethq deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install oxynozeta-stable/prometheus-cachethq --name my-release
```

The command deploys prometheus-cachethq on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the prometheus-cachethq chart and their default values.

| Parameter                                     | Description                                                                                                                                                | Default                         |
| --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `replicaCount`                                | Desired number of pods                                                                                                                                     | `1`                             |
| `image.repository`                            | Container image name (Including repository name if not `hub.docker.com`).                                                                                  | `oxynozeta/prometheus-cachethq` |
| `image.pullPolicy`                            | Container pull policy.                                                                                                                                     | `IfNotPresent`                  |
| `image.tag`                                   | Container image tag.                                                                                                                                       | `1.0.0`                         |
| `imagePullSecrets`                            | Image pull secrets                                                                                                                                         | `[]`                            |
| `nameOverride`                                | Name override                                                                                                                                              | `""`                            |
| `fullnameOverride`                            | Fullname override                                                                                                                                          | `""`                            |
| `serviceAccount.create`                       | Specifies whether a service account should be created                                                                                                      | `true`                          |
| `serviceAccount.name`                         | Service account name created if create is true or service account name to be linked. If empty and create at true, this will be generated.                  | `""`                            |
| `podSecurityContext`                          | Pod security context                                                                                                                                       | `{}`                            |
| `securityContext`                             | Security context                                                                                                                                           | `{}`                            |
| `service.annotations`                         | Annotations to add to service                                                                                                                              | `{}`                            |
| `service.clusterIP`                           | IP address to assign to service                                                                                                                            | `""`                            |
| `service.externalIPs`                         | Service external IP addresses                                                                                                                              | `[]`                            |
| `service.loadBalancerIP`                      | IP address to assign to load balancer (if supported)                                                                                                       | `""`                            |
| `service.loadBalancerSourceRanges`            | List of IP CIDRs allowed access to load balancer (if supported)                                                                                            | `[]`                            |
| `service.port`                                | Service port to expose                                                                                                                                     | `80`                            |
| `service.type`                                | Type of service to create                                                                                                                                  | `ClusterIP`                     |
| `ingress.enabled`                             | Enables Ingress                                                                                                                                            | `false`                         |
| `ingress.annotations`                         | Ingress annotations                                                                                                                                        | `{}`                            |
| `ingress.hosts`                               | Ingress accepted hostnames                                                                                                                                 | `[]`                            |
| `ingress.tls`                                 | Ingress TLS configuration                                                                                                                                  | `[]`                            |
| `config`                                      | [Prometheus-CachetHQ configuration](https://oxyno-zeta.github.io/prometheus-cachethq/)                                                                     | Example of configuration        |
| `resources`                                   | CPU/Memory resource requests/limits.                                                                                                                       | `{}`                            |
| `nodeSelector`                                | Node labels for pod assignment                                                                                                                             | `{}`                            |
| `tolerations`                                 | List of node taints to tolerate (requires Kubernetes >= 1.6)                                                                                               | `[]`                            |
| `affinity`                                    | List of affinities (requires Kubernetes >=1.6)                                                                                                             | `{}`                            |
| `livenessProbe`                               | Liveness probe settings for logstash container                                                                                                             | (see `values.yaml`)             |
| `readinessProbe`                              | Readiness probe settings for logstash container                                                                                                            | (see `values.yaml`)             |
| `prometheus.serviceMonitor.enabled`           | If true, a ServiceMonitor CRD is created for a prometheus operator                                                                                         | `false`                         |
| `prometheus.serviceMonitor.namespace`         | If set, the ServiceMonitor will be installed in a different namespace                                                                                      | `""`                            |
| `prometheus.serviceMonitor.labels`            | Labels for prometheus operator                                                                                                                             | `{}`                            |
| `prometheus.serviceMonitor.interval`          | Interval at which metrics should be scraped                                                                                                                | `""`                            |
| `prometheus.serviceMonitor.scrapeTimeout`     | Timeout after which the scrape is ended                                                                                                                    | `""`                            |
| `prometheus.serviceMonitor.scheme`            | Scheme to use for scraping                                                                                                                                 | `http`                          |
| `prometheus.serviceMonitor.metricRelabelings` | Metric relabelings                                                                                                                                         | `[]`                            |
| `prometheus.serviceMonitor.relabelings`       | Relabelings                                                                                                                                                | `[]`                            |
| `podAnnotations`                              | Additional annotations to apply to the pod.                                                                                                                | `{}`                            |
| `podDisruptionBudget.enabled`                 | If true, create a pod disruption budget for prometheus pods. The created resource cannot be modified once created - it must be deleted to perform a change | `false`                         |
| `podDisruptionBudget.minAvailable`            | Minimum number / percentage of pods that should remain scheduled                                                                                           | `1`                             |
| `podDisruptionBudget.maxUnavailable`          | Maximum number / percentage of pods that may be made unavailable                                                                                           | `""`                            |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install oxynozeta-stable/prometheus-cachethq --name my-release --set=image.tag="XXXXXXX"
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install oxynozeta-stable/prometheus-cachethq --name my-release -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)
