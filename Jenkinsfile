pipeline {
    agent any
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
        IMAGE_NAME = "susanto0308/employee-app:${TAG}"
    }
    stages {
       stage('Docker Build App') {
            steps {
                script {
                    sh 'docker build -t ${IMAGE_NAME} .'
                    sh 'docker container stop myapp | true' 
                    sh 'docker container rm myapp | true' 
                    sh 'docker run --name myapp -d -p 8082:80 ${IMAGE_NAME}'
                }
            }
       }
       stage('Docker Build Database') {
            steps {
                script {
                    sh 'docker container stop mysql1 | true' 
                    sh 'docker container rm mysql1 | true' 
                    sh 'docker run --name mysql1 -d -p 3333:3306 -e MYSQL_ROOT_PASSWORD=root mysql:8'                 
                }
            }
        }
       stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', 'Docker_Akses') {
                        docker.image("${IMAGE_NAME}").push()
                    }
                }
            }
        }
    }
}
