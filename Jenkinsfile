pipeline {
    agent any

    tools {
        nodejs 'NodeJS'
    }

    environment {
        SONAR_PROJECT_KEY = 'complete-cicd-02'
        SONAR_SCANNER_HOME = 'SonarQubeScanner'
    }

    stages {
        stage('Github Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'jen-git-dind',
                    url: 'https://github.com/DeepDN/Complete_CICD_02.git'
            }
        }

        stage('Unit Test') {
            steps {
                sh 'npm install'
                // sh 'npm test'
            }
        }

        stage('Sonarqube Analysis') {
            steps {
                withCredentials([string(credentialsId: 'complete-cicd-02', variable: 'SONAR_TOKEN')]) {
                    withSonarQubeEnv('Sonarqube') {
                        sh """
                            ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
                            -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                            -Dsonar.sources=. \
                            -Dsonar.host.url=http://sonarqube:9000 \
                            -Dsonar.token=${SONAR_TOKEN}
                        """
                    }
                }
            }
        }
    }
}