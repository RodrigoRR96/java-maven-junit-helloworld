pipeline {
 agent none

 //agent any
 stages {
  stage('Checkout Code') {
    agent {
  docker {
   image 'maven:3.5.2'
  }
 }
   environment {
    SERVICE_CREDS = credentials('javaProject')
   }
   steps {
    git 'https://github.com/RodrigoR96/java-maven-junit-helloworld.git'
   }
  }
  stage('Build') {
    agent {
  docker {
   image 'maven:3.5.2'
  }
 }
   steps {
    sh "mvn compile"
   }
  }
  stage('Unit Tests') {
    agent {
  docker {
   image 'maven:3.5.2'
  }
 }
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
    agent {
  docker {
   image 'maven:3.5.2'
  }
 }
   steps {
    sh "mvn site"
   }
  }
  stage('Security Analisis') {
    agent {
  docker {
   image 'maven:3.5.2'
  }
 }
   steps {
    withSonarQubeEnv('sonarqube') {
     sh 'mvn verify sonar:sonar -Dsonar.login="$SERVICE_CREDS"'
    }
   }
  }
  stage("Quality Gate") {
    agent {
  docker {
   image 'maven:3.5.2'
  }
 }
   steps {
    timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
     sleep(20)
     waitForQualityGate abortPipeline: true
    }
   }
  }

  stage('Deploy') {
   agent any
   steps {
    sh'pwd'
    sh'docker build -t hello-world .'
    //sh'docker run hello-world'
   }
  }
 }
 post {
    always {
     cleanWs()
    }
   }
}
