FROM openjdk:8-jre-alpine
COPY /target .
ENTRYPOINT [ "java", "-jar" ,"embedash-1.1-SNAPSHOT.jar"]