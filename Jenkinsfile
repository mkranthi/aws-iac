
pipeline {
    agent any 

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'prod'], description: 'Choose Environment')
    }
    stages {
        stage ('checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/mkranthi/aws-iac.git'
            }
        }
        stage('executing terraform init') {
            steps {
                sh 'terraform init'
    }
}
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=${params.ENVIRONMENT}.tfvars"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh "terraform apply -var-file=${params.ENVIRONMENT}.tfvars -auto-approve"
            }
        }
              
}
}
