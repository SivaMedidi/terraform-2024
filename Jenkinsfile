pipeline {
    agent any


    environment {
    SVC_ACCOUNT_KEY = credentials('JENKINS-AUTH')
  }
     
    stages {
          

	stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'echo $SVC_ACCOUNT_KEY | base64 -w0 > ./terraform.json'
                sh 'terraform --version'               
               
            }
        }
	    
	   
        
         stage('Initialize Terraform') {
		  steps {
		 
                sh 'terraform init'
	 }
	 }
		
	stage('Terraform plan') {
		 steps {
		
		 sh 'terraform plan'
	}
	}
	stage('Terraform Action') {
		 steps {
		
		 sh 'terraform $ACTION --auto-approve'
	}
	}
}
}
