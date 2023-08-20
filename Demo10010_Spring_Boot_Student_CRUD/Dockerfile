FROM maven:3.6.3-jdk-8 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jre-slim
COPY --from=build /target/Demo10010_Spring_Boot_Student_CRUD-0.0.1-SNAPSHOT.jar Demo10010_Spring_Boot_Student_CRUD.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","Demo10010_Spring_Boot_Student_CRUD.jar" ]