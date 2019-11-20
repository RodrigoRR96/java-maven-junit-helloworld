pipeline {
 agent { docker { image 'maven:3.5.2' } }
//agent any
 stages {
  stage('Checkout Code') {
   steps {
    //sh 'whoami'
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
