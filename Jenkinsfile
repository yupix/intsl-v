pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh '''export PATH="$(pwd)/usr/bin:$PATH"
intsl -V'''
      }
    }

  }
}