pipeline{
    agent any
    tools {
        nodejs 'NodeJS'
    }
    environment {
        SONAR_PROJECT_KEY= 'Complete-cicd-02'
        SONAR_SCANNER_HOME= tool 'SonarQubeScanner'
        ECR_REPO= 'iquantawsrepo'
        JOB_NAME_NOW= 'cicd02'
        ECR_REGISTRY= '265508367919.dkr.ecr.us-east-1.amazonaws.com'
        IMAGE_TAG= 'latest'



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
                    script {
                        docker.build("${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}")
                        }
                }
            }
            stage('Trivy scan'){
                steps{
                    sh """
                    trivy image \
                        --severity HIGH,CRITICAL \
                        --no-progress \
                        --format table \
                        -o trivy-report.html \
                        ${JOB_NAME_NOW}:latest
                    """
                }
            }
            stage('Login to ECR'){
                steps{
                    sh """
                    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 265508367919.dkr.ecr.us-east-1.amazonaws.com

                    """
                }
            }
            stage('Push Image to ECR'){
                steps{
                    script{
                        docker.image("${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}").push()
                    }
                }
            }

        }
}