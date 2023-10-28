docker compose -f ./ingest/docker-compose.yml --env-file=".env" down
docker compose -f ./core/docker-compose.yml --env-file=".env" down
docker compose -f ./eureka/docker-compose.yml down
docker compose -f ./apigateway/docker-compose.yml --env-file=".env" down
docker compose -f ./postgre/docker-compose.yml down
docker compose -f ./secure/docker-compose.yml --env-file=".env" down
docker compose -f ./redis/docker-compose.yml down
