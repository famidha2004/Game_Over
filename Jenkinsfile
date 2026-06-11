pipeline {

    agent {
        label 'slave'
    }

    environment {
        CONTAINER_NAME = 'gameover'
        }
    stages {  
    stage('Git check') { 
        git branch: 'main', url: 'https://github.com/harikrishnan-knr/Game_Over.git'
    }
    
    stage('Stop Old Container') {
        steps {
        sh 'docker stop ${CONTAINER_NAME} || true'
        sh 'docker rm ${CONTAINER_NAME} || true'
        }
    }

    stage('Build') {
        sh '''docker -v
        docker build -t ${CONTAINER_NAME} .
        docker run -d -p 80:80 ${CONTAINER_NAME}
        docker ps'''
    }
    }
post {
        success {
            mail to: 'harikrishnanknr07@gmail.com',
                 subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 body: "Build succeeded: ${env.BUILD_URL}"
        }

        failure {
            mail to: 'harikrishnanknr07@gmail.com',
                 subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 body: "Build failed: ${env.BUILD_URL}"
        }
    }
}
