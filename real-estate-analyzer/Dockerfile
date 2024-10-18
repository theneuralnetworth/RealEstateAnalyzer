FROM openjdk:11-jdk-slim

WORKDIR /app

RUN apt-get update && apt-get install -y maven

COPY pom.xml .
COPY src ./src

RUN mvn clean package

EXPOSE 8080

CMD ["java", "-jar", "target/real-estate-analyzer-1.0-SNAPSHOT.jar"]
