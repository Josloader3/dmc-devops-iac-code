# =========================
# STAGE 1: Build
# =========================
FROM eclipse-temurin:21-jdk-alpine AS builder

WORKDIR /app

# Copiamos wrapper y config primero (cache)
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle settings.gradle ./

# Damos permisos al wrapper
RUN chmod +x gradlew

# Descargamos dependencias (usa la versión correcta de Gradle)
RUN ./gradlew dependencies --no-daemon

# Copiamos el resto del proyecto
COPY . .

# Compilamos el jar
RUN ./gradlew clean build -x test --no-daemon

# =========================
# STAGE 2: Runtime (lite)
# =========================
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8090

ENTRYPOINT ["java", "-jar", "app.jar"]
