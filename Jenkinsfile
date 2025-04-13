pipeline {
    agent any

    environment {
        IMAGE_NAME = 'your-image-name'
        CONTAINER_NAME = 'your-container-name'
        APP_PORT = '8081'   // changed from 80 to avoid conflict
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/tupakulamanoj/Jenkins-Pipeline-for-Docker-Deployment.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:latest .
                '''
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Deploy New Container') {
            steps {
                sh '''
                docker run -d --name $CONTAINER_NAME -p $APP_PORT:$APP_PORT $IMAGE_NAME:latest
                '''
            }
        }
    }
}
