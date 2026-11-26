pipeline{
    agent any
    tools {
        nodejs 'NodeJS'
    }
    environment {
        SONAR_PROJECT_KEY= 'Complete-cicd-02'
        SONAR_SCANNER_HOME= tool 'SonarQubeScanner'

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
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=${SONAR_TOKEN}
                        """
    
}
}
                }
            }

        }
}