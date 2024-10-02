pipeline {
    agent any


    environment {
    SVC_ACCOUNT_KEY = credentials('GCP-SECRET')
  }
     
    stages {
          

	stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./terraform.json'
                sh 'terraform --version'               
               
            }
        }
	    
	   
        
         stage('Initialize Terraform') {
		  steps {
		 
                sh 'terraform init'
	 }
	 }
		
	
	stage('Terraform Action') {
		 steps {
		
		 sh 'terraform plan'
	}
	}
}
}
