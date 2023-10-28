# docker image 만들지 않고 maven image를 사용하여 직접 빌드

docker run -it --rm -v "$(pwd)/datacore/datamanager":/usr/src/mymaven -w /usr/src/mymaven maven:3.8-jdk-8 mvn -DskipTests clean package
docker run -it --rm -v "$(pwd)/datacore/ingestinterface":/usr/src/mymaven -w /usr/src/mymaven maven:3.8-jdk-8 mvn -DskipTests clean package
docker run -it --rm -v "$(pwd)/datacore/dataservicebroker":/usr/src/mymaven -w /usr/src/mymaven maven:3.8-jdk-8 mvn -DskipTests clean package       # 얘는 체크필요..
docker run -it --rm -v "$(pwd)/datacore/ui":/usr/src/mymaven -w /usr/src/mymaven maven:3.8-jdk-8 mvn -DskipTests clean package
docker run -it --rm -v "$(pwd)/datacore/dashboard":/usr/src/mymaven -w /usr/src/mymaven maven:3.8-jdk-8 mvn -DskipTests clean package
docker run -it --rm -v "$(pwd)/datacore/pushagent":/usr/src/mymaven -w /usr/src/mymaven maven:3.8-jdk-8 mvn -DskipTests clean package
