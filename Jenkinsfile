pipeline {
 agent { docker { image 'maven:3.5.2' } }
//agent any
 stages {
  stage('Checkout Code') {
   environment {
                SERVICE_CREDS = credentials('javaProject')
            }
   steps {
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
    sh 'mvn verify sonar:sonar -Dsonar.login="$SERVICE_CREDS"'
   }
  }
  stage('Deploy') {
   steps {
    echo 'Deploy...'
   }
  }
 }
}
