pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                sh 'git clone https://github.com/dhajczuk3/Coursework2.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dhajczuk3/coursework2:latest .'
            }
        }
        stage('Test Container') {
            steps {
                sh 'docker run --rm dhajczuk3/coursework2:latest echo "Test successful"'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'echo $DOCKERHUB_PASSWORD | docker login --username $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker push dhajczuk3/coursework2:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl set image deployment/my-nodejs-app coursework2=dhajczuk3/coursework2:latest'
            }
        }
    }
}
