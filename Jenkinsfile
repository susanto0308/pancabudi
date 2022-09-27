pipeline {
    agent any
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker run --name mysql1 -d -p 3333:3306 -e MYSQL_ROOT_PASSWORD=root mysql:8'                    
                }
            }
        }	    
    }
}
