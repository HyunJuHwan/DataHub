
docker run -it --rm -v $(pwd):/apigw -w /apigw/apigw adoptopenjdk/maven-openjdk11 mvn -DskipTests clean package
