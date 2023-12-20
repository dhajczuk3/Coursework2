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
                sh 'docker run --rm coursework2 echo "Test succesful."'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl rollout status deployment/my-app-deployment'
            }
        }
        stage('Push to DockerHub') {
            steps {
                sh 'docker login -u dhajczuk3 -p Twojtata8'
                sh 'docker push coursework2'
            }
        }
    }
}
