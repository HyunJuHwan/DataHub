cp add_files/commons-pool2-2.12.0.jar ./ingest/ingest-daemon/src/main/docker/agent/libext/commons-pool2-2.12.0.jar

docker run -it --rm -v $(pwd):/ingest -w /ingest/ingest adoptopenjdk/maven-openjdk11 mvn -DskipTests clean package

cp -f ingest/ingest-adapter/target/ingest-adapter-1.0.0.jar ingest/ingest-daemon/src/main/docker/agent/lib/
cp -f ingest/ingest-core/target/ingest-core-1.0.0.jar ingest/ingest-daemon/src/main/docker/agent/lib/ 

# cd ingest-web

# docker build -t ingest-web --build-arg TZ=Asia/Seoul --build-arg U_ID=$(id -u) --build-arg G_ID=$(id -g) --build-arg USER=${USER} --build-arg JAR_FILE=ingest-web-1.0.0.jar .

# cd ingest-daemon

# docker build -t ingest-daemon --build-arg TZ=Asia/Seoul --build-arg U_ID=$(id -u) --build-arg G_ID=$(id -g) --build-arg USER=${USER} --build-arg JAR_FILE=ingest-daemon-1.0.0.jar .