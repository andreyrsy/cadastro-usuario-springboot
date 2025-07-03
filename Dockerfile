# Usamos uma imagem oficial do Maven com o JDK 21, conforme definido no pom.xml.
# O "AS build" nomeia este estágio para que possamos referenciá-lo depois.
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn package -DskipTests

FROM eclipse-temurin:21-jre-jammy
RUN groupadd --gid 1000 springuser && useradd --uid 1000 --gid 1000 -m springuser
COPY --from=build /app/target/*.jar app.jar

USER springuser

EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]
