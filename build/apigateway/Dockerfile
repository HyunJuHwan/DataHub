FROM adoptopenjdk/openjdk11:jre-11.0.9_11.1-alpine

COPY . .

ENTRYPOINT ["java", "-server", "-jar", "apigw-1.0.0.jar", ">", "/dev/null 2>&1 &"]
