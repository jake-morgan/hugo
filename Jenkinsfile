pipeline {
    agent any

    triggers {
        pollSCM('*/10 * * * *')
    }

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
                sh 'docker login --username ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD}'
                sh 'docker push ${IMAGE_NAME}'
            }
        }
    }
}
