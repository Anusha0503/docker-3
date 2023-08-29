FROM openjdk:8
EXPOSE 8080
ADD target/*.jar newmaven.jar 
ENTRYPOINT ["java","-jar","/newmaven.jar"]
