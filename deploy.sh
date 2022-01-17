kubectl apply -f ns.yaml
kubectl apply -f sc.yaml
kubectl apply -f pv.yaml
kubectl apply -n redis -f redis-config.yaml
kubectl apply -n redis -f redis-statefulset.yaml
kubectl apply -n redis -f redis-service.yaml

kubectl get sc
kubectl get pv
kubectl get all -n redis