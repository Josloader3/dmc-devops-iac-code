# 🚀 Spring Boot (Java 21) – Aplicacion Dockerizada

Diploma DevOps 2026 - TRABAJO FINAL Gestión de Infraestructura para DevOps

Este proyecto es una aplicación **Java Spring Boot** construida con **Gradle** y **Java 21**, preparada para ejecutarse fácilmente usando **Docker** mediante un **build multi-stage optimizado**.

La aplicación corre internamente en el **puerto 8090** y se expone hacia el exterior por el **puerto 5000**.

---

## 🧱 Requisitos

Solo necesitas:

- 🐳 **Docker** (v20+ recomendado)

> ❌ No necesitas Java, Gradle ni dependencias instaladas localmente.

---

## 📦 Construcción de la imagen Docker

Desde la raíz del proyecto (donde está el `Dockerfile`):

```bash
docker build -t app-infradevops-dmc .
```

Esto realizará:
1. Compilación del proyecto con **Gradle Wrapper**
2. Generación del JAR
3. Creación de una imagen final liviana solo con el runtime

---

## ▶️ Ejecución del contenedor

```bash
docker run -p 5000:8090 app-infradevops-dmc
```

📍 Accede a la aplicación desde tu navegador o cliente HTTP:

```
http://localhost:5000/hello
```

---

## 🔌 Puertos

| Tipo | Puerto |
|------|--------|
| Interno (Spring Boot) | `8090` |
| Externo (Docker) | `5000` |

---

## 🐳 Dockerfile (resumen técnico)

- Multi-stage build
- Java 21
- Gradle Wrapper (`./gradlew`)
- Imagen final basada en `eclipse-temurin:21-jre-alpine`
- Tamaño optimizado para DockerHub

---

## Autor

Jose Bautista 2026
