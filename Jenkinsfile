pipeline {
 agent { docker { image 'maven:3.5.2' } }
//agent any
 stages {
  stage('Checkout Code') {
   environment {
                SERVICE_CREDS = credentials('TokenPrueba')
            }
   steps {
    sh 'echo "Service user is $SERVICE_CREDS"'
    git 'https://github.com/RodrigoR96/java-maven-junit-helloworld.git'
   }
  }
  stage('Build') {
   steps {
    sh "mvn compile"
   }
  }
  stage('Unit Tests') {
   steps {
    sh "mvn clean test"
   }
  }
  stage('Security Analisis') {
   steps {
    sh "mvn verify sonar:sonar"
   }
  }
  stage('Deploy') {
   steps {
    echo 'Deploy...'
   }
  }
 }
}
