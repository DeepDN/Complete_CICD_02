pipeline{
    agent any
    tools {
        nodejs 'NodeJS'
    }
    environment {
        SONAR_PROJECT_KEY= 'Complete-cicd-02'
        SONAR_SCANNER_HOME= tool 'SonarQubeScanner'
        DOCKER_HUM_REPO=deepakdn999/complete-cicd-02

    }
        stages{
            stage('Github'){
                steps{
                    git branch: 'main', credentialsId: 'jen-git-dind', url: 'https://github.com/DeepDN/Complete_CICD_02.git'
                }
            }
            stage('Unit test') {
                steps{
                    sh 'npm install'

                }
            }
            stage('Sonarqube Analysis'){
                steps{
                    withCredentials([string(credentialsId: 'complete-cicd-02-token', variable: 'SONAR_TOKEN')]) {
                    withSonarQubeEnv('SonarQube') {
                        sh """
                        ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
                        -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://192.168.1.105:9000 \
                        -Dsonar.login=${SONAR_TOKEN}
                        """
    
}
}
                }
            }

            stage('Docker image'){
                steps{
                    docker.build("$(DOCKER_HUM_REPO)")
                }
            }

        }
}