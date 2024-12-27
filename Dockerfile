FROM openjdk:21-jdk-slim
# Set the working directory inside the container
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

COPY src ./src

RUN chmod +x mvnw

RUN ./mvnw clean install -DskipTests

COPY target/demo-0.0.1-SNAPSHOT.jar /app/demo.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/demo.jar"]