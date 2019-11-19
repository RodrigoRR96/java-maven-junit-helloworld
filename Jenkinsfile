pipeline {
 agent any
 //def mvnHome = tool 'M3'

 stages {
  stage('Checkout Code') {
   steps {
    git 'https://github.com/RodrigoR96/java-maven-junit-helloworld.git'
   }
  }
  stage('Compile') {
   steps {
    sh "'${mvnHome}/bin/mvn' compile"
   }
  }
  stage('JUnit Test') {
   steps {
    sh "'${mvnHome}/bin/mvn' clean test"
   }
  }
  stage('Performance Test') {
   steps {
    sh "'${mvnHome}/bin/mvn' verify"
   }
  }
  stage('Deploy') {
   steps {
    echo 'Deploy...'
   }
  }
 }
}
