pipeline{
	agent any
	tools {
		nodejs 'NodeJS'
	}
	stages{
		stage('Github Chueckout'){
			steps{
				git branch: 'main', credentialsId: 'jen-git-dind', url: 'https://github.com/DeepDN/Complete_CICD_02.git'
			}
		}
		stage('Unit Test'){
			steps{
					// sh 'npm test'
					sh 'npm install'
				}
			}
		}
		
	}
