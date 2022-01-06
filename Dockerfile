FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY . /app
RUN mvn clean install package

FROM tomcat:8-jre8-alpine
COPY --from=build /app/target/java-hello-world.war $CATALINA_HOME/webapps
EXPOSE 8080
