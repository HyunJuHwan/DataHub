docker run -it --name test-servicebroker -v "$(pwd)/datacore/dataservicebroker":/usr/src/mymaven -w /usr/src/mymaven maven:3.8-jdk-8 mvn test
