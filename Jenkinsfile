pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/vythri90/samplenode.git'
        IMAGE_NAME = 'vythri90/jk'
        DOCKERHUB_USER = 'vythri90' // Your Docker Hub username
    }

    stages {
        stage('Clone Repository') {
            steps {
                git REPO_URL
            }
        }

        stage('Build Node.js Application') {
            steps {
                script {
                    sh 'npm install'
                    sh 'npm run build' // Modify this if your build process differs
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                        sh "docker push ${IMAGE_NAME}"
                    }
                }
            }
        }
    }
}
