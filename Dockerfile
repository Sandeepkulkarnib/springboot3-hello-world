FROM openjdk:17
WORKDIR /app
COPY --from=builder /build/target/springboot3-hello-world.jar app.jar
EXPOSE 8099
ENTRYPOINT ["java", "-jar", "app.jar"]
