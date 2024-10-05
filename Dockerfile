# FROM openjdk:8
# EXPOSE 8080
# ADD target/jb-hello-world-maven-0.2.0.jar jb-hello-world-maven-0.2.0.jar
# ENTRYPOINT ["java","-jar","/jb-hello-world-maven-0.2.0.jar"]

FROM maven:3.8.1-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY . .
RUN mvn package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/jb-hello-world-maven-0.2.0.jar .
CMD ["java", "-jar", "jb-hello-world-maven-0.2.0.jar"]
EXPOSE 8080
