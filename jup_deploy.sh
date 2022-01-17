# from https://zero-to-jupyterhub.readthedocs.io/en/latest/jupyterhub/installation.html#initialize-a-helm-chart-configuration-file

helm upgrade --cleanup-on-fail   --install heml-jh jupyterhub/jupyterhub   --namespace jh   --create-namespace   --version=1.2.0   --values config.yaml

# then run minikube service proxy-public -n jh in powershell