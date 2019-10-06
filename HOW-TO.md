- package all charts in stable and incubator.
- commit new tar.gz files
- For the first time, go in stable and incubator and run
  ```bash
  helm repo index --url https://oxyno-zeta.github.io/helm-charts/ .
  ```
- For all after, go in stable and incubator and run
  ```bash
  helm repo index --url https://oxyno-zeta.github.io/helm-charts/stable/ --merge index.yaml .
  helm repo index --url https://oxyno-zeta.github.io/helm-charts/incubator/ --merge index.yaml .
  ```
