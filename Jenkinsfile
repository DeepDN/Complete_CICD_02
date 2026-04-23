pipeline{
	agent: any
	stages{
		stage('Github Chueckout'){
			steps{
				git branch: 'main', credentialsId: 'jen-git-dind', url: 'https://github.com/DeepDN/Complete_CICD_02.git'
			}
		}
		
	}
}