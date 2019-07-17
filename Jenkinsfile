pipeline {
    agent any

    triggers {
        pollSCM('*/2 * * * *')
    }

    environment {
        IMAGE_NAME = 'jakemorgan/hugo'
    }

    stages {
        stage('Lint') {
            steps {
                echo 'Linting..'
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t ${IMAGE_NAME}:latest .'
            }
        }
        stage('Scan') {
            steps {
                echo 'Scanning..'
            }
        }
        // stage('Push') {
        //     steps {
        //         echo 'Push..'
        //         sh 'docker push ${IMAGE_NAME}'
        //     }
        // }
    }
}
