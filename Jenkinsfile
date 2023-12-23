pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                git clone https://github.com/dhajczuk3/Coursework2.git
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t dhajczuk3/coursework2:latest .'
            }
        }
        stage('Test Container') {
            steps {
                sh 'sudo docker run --rm dhajczuk3/coursework2:latest echo "Test successful"'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'sudo echo $DOCKERHUB_PASSWORD | docker login --username $DOCKERHUB_USERNAME --password-stdin'
                    sh 'sudo docker push dhajczuk3/coursework2:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'sudo kubectl set image deployment/my-nodejs-app coursework2=dhajczuk3/coursework2:latest'
            }
        }
    }
}
