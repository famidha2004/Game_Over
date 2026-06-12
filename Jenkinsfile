pipeline {

    agent {
        label 'slave'
    }

    environment {
        IMAGE_NAME = 'gameover-web'
        CONTAINER_NAME = 'gameover'
        }
    
    stages {  
    stage('Git check') { 
        steps {
        git branch: 'main', url: 'https://github.com/famidha2004/Game_Over.git'
        }
    }

    stage('Build') {
        steps {
        sh '''docker -v
        docker build -t ${IMAGE_NAME} .'''
        }
    }
        
    stage('Stop Old Container') {
        steps {
        sh 'docker stop ${CONTAINER_NAME} || true'
        sh 'docker rm -f ${CONTAINER_NAME} || true'
            }
        }
        
    stage('Run') { 
        steps {
        sh '''docker run -d ${IMAGE_NAME} -p 90:90 --name ${CONTAINER_NAME}:latest
        docker ps'''
        }
    }
    }
    
post {
        success {
            mail to: 'famidhashamshath@gmail.com',
                 subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 body: "Build succeeded: ${env.BUILD_URL}"
        }

        failure {
            mail to: 'famidhashamshath@gmail.com',
                 subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 body: "Build failed: ${env.BUILD_URL}"
        }
    }
}
