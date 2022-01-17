# shiny_redis_example

## Redis Cluster Notes

- https://redis.io/topics/cluster-tutorial
- https://www.containiq.com/post/deploy-redis-cluster-on-kubernetes
- https://medium.com/swlh/production-checklist-for-redis-on-kubernetes-60173d5a5325

### Redis Cluster and Docker

Currently Redis Cluster does not support NATted environments and in general environments where IP addresses or TCP ports are remapped.

Docker uses a technique called port mapping: programs running inside Docker containers may be exposed with a different port compared to the one the program believes to be using. This is useful in order to run multiple containers using the same ports, at the same time, in the same server.

In order to make Docker compatible with Redis Cluster you need to use the host networking mode of Docker. Please check the --net=host option in the [Docker documentation](https://docs.docker.com/engine/userguide/networking/dockernetworks/) for more information.
