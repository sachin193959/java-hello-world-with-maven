FROM openjdk:8
EXPOSE 8080
ADD target/jb-hello-world-maven-0.2.0.jar jb-hello-world-maven-0.2.0.jar
ENTRYPOINT ["java","-jar","/jb-hello-world-maven-0.2.0.jar"]
