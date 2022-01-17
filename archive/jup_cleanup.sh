# kubectl delete service/jupyter -n spark
# kubectl delete service/jupyter-headless -n spark
# kubectl delete statefulset.apps/jupyter -n spark

kubectl delete pvc/jupyterlab-pvc -n jlab
kubectl delete service/jupyterlab -n jlab
kubectl delete deployment.apps/jupyterlab -n jlab
kubectl delete ns/jlab