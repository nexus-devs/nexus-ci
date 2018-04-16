#!/bin/bash
docker swarm init

# Create private image registry on our swarm
if [ ! "$(docker service ls | grep registry)" ]; then
  docker service create -d \
    --name registry \
    -p 5000:5000 \
    --mount type=volume,source=registry,destination=/var/lib/registry,volume-driver=local \
    registry:latest
fi

# Deploy
make images
docker stack deploy --compose-file docker/docker-compose.yml ci
docker service logs ci_agent -f --tail=10