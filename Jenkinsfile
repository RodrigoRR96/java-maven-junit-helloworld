pipeline { 
   agent any 
   def mvnHome = tool 'M3' 
 
   stage('Checkout Code') {  
      git 'https://github.com/RodrigoR96/java-maven-junit-helloworld.git' 
   } 
   stage('Compile') { 
      sh "'${mvnHome}/bin/mvn' compile" 
   } 
   stage('JUnit Test') { 
      if (isUnix()) { 
         sh "'${mvnHome}/bin/mvn' clean test" 
      } else { 
         bat(/"${mvnHome}\bin\mvn" clean test/) 
      } 
   } 
  stage('Performance Test') { 
      if (isUnix()) { 
         sh "'${mvnHome}/bin/mvn' verify" 
      } else { 
         bat(/"${mvnHome}\bin\mvn" verify/) 
      } 
   } 
   stage('Deploy') { 
      echo 'Deploy...' 
   } 
} 