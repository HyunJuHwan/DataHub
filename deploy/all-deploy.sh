docker network create citydatahub-datacore


docker compose -f ./postgre/docker-compose.yml up -d
docker compose -f ./eureka/docker-compose.yml up -d
docker compose -f ./redis/docker-compose.yml up -d
docker compose -f ./core/docker-compose.yml --env-file=".env" up -d
docker compose -f ./ingest/docker-compose.yml --env-file=".env" up -d
docker compose -f ./apigateway/docker-compose.yml --env-file=".env" up -d
docker compose -f ./secure/docker-compose.yml --env-file=".env" up -d

docker cp security_back_user:app/keys/ ../deploy
