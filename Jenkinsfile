pipeline {
 agent any
//tools { 
        //maven 'Maven 3.5.2' 
        //jdk 'jdk8' 
    //}
 stages {
  stage('Checkout Code') {
   steps {
    git 'https://github.com/RodrigoR96/java-maven-junit-helloworld.git'
   }
  }
  stage('Compile') {
   steps {
    sh "mvn compile"
   }
  }
  stage('JUnit Test') {
   steps {
    sh "mvn clean test"
   }
  }
  stage('Performance Test') {
   steps {
    sh "mvn verify"
   }
  }
  stage('Deploy') {
   steps {
    echo 'Deploy...'
   }
  }
 }
}
