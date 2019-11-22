pipeline {
 agent {
  docker {
   image 'maven:3.5.2'
  }
 }
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
   post {
    always {
     junit '**/surefire-reports/**/*.xml'
    }
   }
  }
  stage('FindBugs Plugin') {
   steps {
    sh "mvn site"
   }
  }
  stage('Security Analisis') {
   steps {
    withSonarQubeEnv('sonarqube') {
     sh 'mvn verify sonar:sonar -Dsonar.login="$SERVICE_CREDS"'
    }
   }
  }
  stage("Quality Gate") {
   steps {
    timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
     sleep(20)
     waitForQualityGate abortPipeline: true
    }
   }
  }

  stage('Deploy') {
   steps {
    echo 'Deploy...'
    sh'mvn package'
   }
  }
 }
}
