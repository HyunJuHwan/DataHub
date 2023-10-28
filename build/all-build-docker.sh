docker compose -f ./apigateway/docker-compose.yml build
docker compose -f ./eureka/docker-compose.yml build
docker compose -f ./core/docker-compose.yml build
docker compose -f ./ingest/docker-compose.yml build
docker compose -f ./postgre/docker-compose.yml build
docker compose -f ./secure/docker-compose.yml build
