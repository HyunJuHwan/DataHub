배포 절차
========

## 배포
```bash
cd deploy
# container 생성 및 실행
./all-deploy.sh
```

## 환경설정
- all-deploy.sh 실행후 생성되는 deploy/keys/public.pem 파일의 내용을 deploy/apigateway/docker-compose.yml 파일의 APIPUBLIC 환경변수에 복사.
- all-deploy.sh 재실행
- http://[server]:40001 에 접속 (coreadmin / admin45@) 하여 어플리케이션 등록후 정보 등록
    - deploy/core/docker-compose.yml => datacore-ui 서비스에 CITYHUB_CLIENT_CLIENTID, CITYHUB_CLIENT_CLIENTSECRET 수정
    - deploy/core/docker-compose.yml => datacore-dashboard 서비스에 CITYHUB_CLIENT_CLIENTID, CITYHUB_CLIENT_CLIENTSECRET 수정
    - deploy/ingest/docker-compose.yml => ingest-web 서비스에 CITYHUB_CLIENT_CLIENTID, CITYHUB_CLIENT_CLIENTSECRET 수정
- app-deploy.sh 재실행
