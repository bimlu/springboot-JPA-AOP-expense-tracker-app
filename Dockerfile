# Docker multi-stage build
 
# 1. Building the App with Maven
FROM maven:3-jdk-11
 
ADD . /expensetracker
WORKDIR /expensetracker
 
# Just echo so we can see, if everything is there :)
RUN ls -l
 
# Run Maven build
RUN mvn clean install
 
 
# 2. Just using the build artifact and then removing the build-container
FROM openjdk:11-jdk
 
VOLUME /tmp
 
# Add Spring Boot app.jar to Container
COPY --from=0 "/expensetracker/target/spring-expense-tracker.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java -Dserver.port=$PORT -DDB_HOST=$DB_HOST -DDB_USER=$DB_USER -DDB_PASS=$DB_PASS -DDB_SCHEMA=$DB_SCHEMA -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8 -XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
