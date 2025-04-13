pipeline {
    agent any
    environment {
        IMAGE_NAME = 'your-image-name'
        CONTAINER_NAME = 'your-container-name'
        HOST_PORT = '8081'   // Host port to access the application
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
                docker run -d --name $CONTAINER_NAME -p $HOST_PORT:80 $IMAGE_NAME:latest
                '''
            }
        }
        stage('Verify Deployment') {
            steps {
                sh '''
                echo "Container is running at http://localhost:$HOST_PORT"
                docker ps | grep $CONTAINER_NAME
                '''
            }
        }
    }
}
