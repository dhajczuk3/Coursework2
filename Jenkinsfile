pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t dhajczuk3/coursework2:latest .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm dhajczuk3/coursework2:latest echo "Test successful."'
            }
        }
        stage('Deploy') {
            steps {
                withKubeConfig([credentialsId: 'cze', serverUrl: 'https://api.k8s.my-company.com']) {
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl rollout status deployment/my-app-deployment'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker push dhajczuk3/coursework2:latest'
                }
            }
        }
    }
}
