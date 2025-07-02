# Estágio 1: Build da Aplicação com Maven
# Usamos uma imagem oficial do Maven com o JDK 21, conforme definido no pom.xml.
# O "AS build" nomeia este estágio para que possamos referenciá-lo depois.
FROM maven:3.9-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de definição do projeto primeiro para aproveitar o cache de layers do Docker.
# Se o pom.xml não mudar, o Docker reutilizará a layer de dependências.
COPY pom.xml .

# Baixa todas as dependências do projeto.
RUN mvn dependency:go-offline

# Copia o resto do código-fonte da aplicação.
COPY src ./src

# Compila a aplicação e gera o pacote .jar, pulando os testes.
RUN mvn package -DskipTests

# Estágio 2: Imagem Final de Execução
# Usamos uma imagem JRE (Java Runtime Environment) enxuta e segura com Java 21.
FROM eclipse-temurin:21-jre-jammy

# Cria um usuário e grupo não-root para rodar a aplicação por segurança.
RUN groupadd --gid 1000 springuser && useradd --uid 1000 --gid 1000 -m springuser

# Copia o arquivo .jar gerado no estágio de build para a imagem final.
COPY --from=build /app/target/*.jar app.jar

# Define o usuário não-root como o usuário padrão para executar a aplicação.
USER springuser

# Expõe a porta 8081, conforme definido no application.properties.
EXPOSE 8081

# Comando para iniciar a aplicação quando o contêiner for executado.
ENTRYPOINT ["java", "-jar", "app.jar"]