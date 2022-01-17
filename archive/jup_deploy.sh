# kubectl apply -n spark -f jupyter.yaml
# kubectl port-forward -n spark service/jupyter 8888:8888
# kubectl get all -n spark

# http:/127.0.0.1:8888 to run

kubectl create namespace jlab
kubectl apply -f jupyterlab-pvc.yaml
kubectl apply -f jupyterlab-deployment.yaml
kubectl apply -f jupyterlab-service.yaml

kubectl get svc -n jlab