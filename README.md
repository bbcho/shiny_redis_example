# shiny_redis_example

## Redis Cluster Notes

- https://redis.io/topics/cluster-tutorial
- https://www.containiq.com/post/deploy-redis-cluster-on-kubernetes \*\* best one
- https://medium.com/swlh/production-checklist-for-redis-on-kubernetes-60173d5a5325

### Redis Cluster and Docker

Currently Redis Cluster does not support NATted environments and in general environments where IP addresses or TCP ports are remapped.

Docker uses a technique called port mapping: programs running inside Docker containers may be exposed with a different port compared to the one the program believes to be using. This is useful in order to run multiple containers using the same ports, at the same time, in the same server.

In order to make Docker compatible with Redis Cluster you need to use the host networking mode of Docker. Please check the --net=host option in the [Docker documentation](https://docs.docker.com/engine/userguide/networking/dockernetworks/) for more information.

### Logging into Redis Kubernetes Cluster

`kubectl -n redis exec -it redis-0 -- sh # master`
or
`kubectl -n redis exec -it redis-1 -- sh # a slave`

```
redis-cli
auth <password>
exit # to exit, do twice
```

### Accessing the Redis Cluster

```{python}
import redis
r = redis.Redis(
    host='redis-0.redis.redis.svc.cluster.local',
    port=6379,
    password='password')
r.set('foo', 'bar')
r.get('foo')

# to store dataframes
# https://stackoverflow.com/questions/57949871/how-to-set-get-pandas-dataframes-into-redis-using-pyarrow/57986261#57986261

import pyarrow as pa
import redis

pool = redis.ConnectionPool(host='localhost', port=6379, db=0)
r = redis.Redis(connection_pool=pool)

def storeInRedis(alias, df):
    df_compressed = pa.serialize(df).to_buffer().to_pybytes()
    res = r.set(alias,df_compressed)
    if res == True:
        print(f'{alias} cached')

def loadFromRedis(alias):
    data = r.get(alias)
    try:
        return pa.deserialize(data)
    except:
        print("No data")


storeInRedis('locations', locdf)

loadFromRedis('locations')
```

```{r}
library(rredis)
rredis::redisConnect(
    host='redis-0.redis.redis.svc.cluster.local',
    port=6379,
    password='password'
    )
redisSet('test','value')
redisGet('test')

data <- data.frame(a = 1:3, b = letters[1:3], c = Sys.Date() - 1:3)
df <- as_tibble(data)
redisSet("df", df)
redisGet("df")

# for faster performance for 10,000 writes per second use:
library("rredis")
redisConnect()
redisConnect(nodelay=TRUE)
for(j in 1:100) redisSet("x", j)

# or pipelining
library("rredis")
redisConnect()
redisSetPipeline(TRUE)
for(j in 1:100) redisSet("x", j)
resp <- redisGetResponse()
```

https://stackoverflow.com/questions/56334974/connect-to-kubernetes-mongo-db-in-different-namespace

# Rstudio

https://stackoverflow.com/questions/70591310/deploy-rstudio-web-ide-on-kubernetes-via-helm
https://artifacthub.io/packages/helm/dsri-helm-charts/rstudio

# Juptyer

https://towardsdatascience.com/jupyter-notebook-spark-on-kubernetes-880af7e06351
