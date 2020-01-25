FROM openjdk:8
ADD target/spring-expense-tracker.jar spring-expense-tracker.jar
EXPOSE 7071 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","spring-expense-tracker.jar"]
