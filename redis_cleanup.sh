kubectl delete service/redis -n redis
kubectl delete statefulset.apps/redis -n redis
kubectl delete pod/redis-0 -n redis
kubectl delete pod/redis-1 -n redis
kubectl delete pod/redis-2 -n redis
kubectl delete pvc/data-redis-0 -n redis
kubectl delete pvc/data-redis-1 -n redis
kubectl delete pvc/data-redis-2 -n redis
kubectl delete pv/local-pv1
kubectl delete pv/local-pv2
kubectl delete pv/local-pv3
kubectl delete sc/local-storage
kubectl delete ns/redis