pipeline {
  agent {
    docker {
      image 'archlinux:latest'
    }

  }
  stages {
    stage('Test') {
      steps {
        sh '''export PATH="$(pwd)/usr/bin:$PATH"
intsl -V'''
      }
    }

  }
}