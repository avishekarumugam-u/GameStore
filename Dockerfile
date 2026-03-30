# Step 1: Build the WAR file using Maven
FROM maven:3.8.4-openjdk-11 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package

# Step 2: Deploy to Tomcat
FROM tomcat:9.0-jdk11-openjdk
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
