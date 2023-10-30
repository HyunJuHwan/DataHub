docker compose -f ./apigateway/docker-compose.yml --env-file=".env"  stop
docker compose -f ./core/docker-compose.yml --env-file=".env" stop
docker compose -f ./eureka/docker-compose.yml stop
docker compose -f ./ingest/docker-compose.yml --env-file=".env" stop
docker compose -f ./postgre/docker-compose.yml stop
docker compose -f ./redis/docker-compose.yml stop
docker compose -f ./secure/docker-compose.yml --env-file=".env" stop

