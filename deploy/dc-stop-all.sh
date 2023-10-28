docker compose -f /home/team3/datahub/deploy/apigateway/docker-compose.yml --env-file=".env"  stop
docker compose -f /home/team3/datahub/deploy/core/docker-compose.yml --env-file=".env" stop
docker compose -f /home/team3/datahub/deploy/eureka/docker-compose.yml stop
docker compose -f /home/team3/datahub/deploy/ingest/docker-compose.yml --env-file=".env" stop
docker compose -f /home/team3/datahub/deploy/postgre/docker-compose.yml stop
docker compose -f /home/team3/datahub/deploy/redis/docker-compose.yml stop
docker compose -f /home/team3/datahub/deploy/secure/docker-compose.yml --env-file=".env" stop

