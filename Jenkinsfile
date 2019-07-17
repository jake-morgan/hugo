pipeline {
    agent any

    environment {
        IMAGE_NAME = 'jakemorgan/hugo'
        DOCKER_USERNAME = credentials('docker-username')
        DOCKER_PASSWORD = credentials('docker-password')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t ${IMAGE_NAME}:latest .'
            }
        }
        stage('Push') {
            steps {
                echo 'Push..'
                sh 'echo ${DOCKER_PASSWORD} | docker login --username ${DOCKER_USERNAME} --password-stdin'
                sh 'docker push ${IMAGE_NAME}'
            }
        }
    }
}
