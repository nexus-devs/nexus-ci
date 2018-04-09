#!/bin/bash
docker stack deploy --compose-file docker-compose.yml ci
docker service logs ci_agent -f