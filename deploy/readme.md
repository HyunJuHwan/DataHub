배포 절차
========

## 배포
```bash
cd deploy
# container 생성 및 실행
./all-deploy.sh
```

## 환경설정
- deploy/.env 파일에서 IP주소 수정
- all-deploy.sh 실행후 생성되는 deploy/keys/public.pem 파일의 내용을 deploy/apigateway/docker-compose.yml 파일의 APIPUBLIC 환경변수에 복사.
- all-deploy.sh 재실행
- http://[server]:40001 에 접속 (coreadmin / admin45@) 하여 어플리케이션 등록후 정보 등록
    - deploy/core/docker-compose.yml => datacore-ui 서비스에 CITYHUB_CLIENT_CLIENTID, CITYHUB_CLIENT_CLIENTSECRET 수정
    - deploy/core/docker-compose.yml => datacore-dashboard 서비스에 CITYHUB_CLIENT_CLIENTID, CITYHUB_CLIENT_CLIENTSECRET 수정
    - deploy/ingest/docker-compose.yml => ingest-web 서비스에 CITYHUB_CLIENT_CLIENTID, CITYHUB_CLIENT_CLIENTSECRET 수정
- app-deploy.sh 재실행


## 이슈리스트
- core : ui,dashboard SSO 적용 동일하게 설정해야 구독기능에서 에러가 발생하지 않는다.
- core : dashboard 구독 버튼 클릭 시 Body에 담긴 데이터 컬럼 명과 vo에서 받는 변수 명이 달라서 이슈 발생.
- core : dashboard 구독 시 websocket 에서 에러 발생. WebSocketSessionManager.java 아래 내용 수정필요.
        ```synchronized(webSocketServerEndpoint.getSession()) {
                    webSocketServerEndpoint.getSession().getBasicRemote().sendText(message);
                };
        ```