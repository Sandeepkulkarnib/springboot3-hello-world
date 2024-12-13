# Stage 1: Build
FROM maven:3.9.4-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/spring-boot-3-hello-world-1.0.0-SNAPSHOT.jar app.jar
EXPOSE 8099
ENTRYPOINT ["java", "-jar", "app.jar"]
