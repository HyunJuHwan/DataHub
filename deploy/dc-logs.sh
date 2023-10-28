docker compose \
-f ./apigateway/docker-compose.yml \
-f ./core/docker-compose.yml \
-f ./eureka/docker-compose.yml \
-f ./ingest/docker-compose.yml \
-f ./postgre/docker-compose.yml \
-f ./redis/docker-compose.yml \
-f ./secure/docker-compose.yml \
--env-file=".env" \
logs -f --tail 5