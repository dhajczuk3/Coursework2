pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t your-image-name .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm your-image-name some-test-command'
            }
        }
        stage('Deploy') {
            steps {
                // Dodaj kroki wdrażania do Kubernetes
            }
        }
    }
}
