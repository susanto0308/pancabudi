pipeline {
    agent any
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
       stage('Docker Build App') {
            steps {
                script {
                    sh 'docker built -t Employee-App'                  
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
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker_Akses') {
                        docker.image("susanto0308/mysql:8").push()
                        docker.image("susanto0308/mysql:8").push("latest")
                    }
                }
            }
        }
    }
}
