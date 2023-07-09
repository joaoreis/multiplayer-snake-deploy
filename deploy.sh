#/bin/bash
docker-compose down
docker-compose pull
docker-compose up --detach --build
