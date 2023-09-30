# Stage 1: Build the Java application
FROM amazoncorretto:17.0.7-alpine AS build
WORKDIR /app
COPY ./build/libs/*-SNAPSHOT.jar greeting-service.jar
RUN java -Djarmode=layertools -jar greeting-service.jar extract

# Stage 2: Create a minimal runtime image
FROM amazoncorretto:17.0.7-alpine
WORKDIR /app
COPY --from=build /app/dependencies/ ./
COPY --from=build /app/spring-boot-loader/ ./
COPY --from=build /app/snapshot-dependencies/ ./
COPY --from=build /app/application/ ./
# EXPOSE 8090
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]