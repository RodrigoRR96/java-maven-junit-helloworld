FROM openjdk:8
COPY java-maven-junit-helloworld/target/*.jar /app/
RUN java -cp app/java-maven-junit-helloworld-2.0-SNAPSHOT.jar com.example.javamavenjunithelloworld.HelloApp 10
