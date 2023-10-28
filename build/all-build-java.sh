# apigwateway build & jar copy
cd apigateway
./maven-clean.sh
cp ./apigw/target/apigw-1.0.0.jar .
cd ..

# core build
cd core
./maven-clean.sh
cd ..

# eureka build
cd eureka
./maven-clean.sh
cp ./demo/target/demo-0.0.1-SNAPSHOT.jar .
cd ..

# ingest build
cd ingest
./maven-clean.sh
