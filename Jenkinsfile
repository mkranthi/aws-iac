
pipeline {
    agent any 
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'prod'], description: 'Choose Environment')
    }
    stages {
        stage ('checkout') {
            steps {
                git branch: 'feature', url: 'https://github.com/mkranthi/aws-iac.git'
            }
        }

        stage('Clean Workspace') {
    steps {
        sh 'rm -rf .terraform'
    }
}

        stage('executing terraform init') {
            steps {
                sh 'terraform init'
    }
}
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=environments/${params.ENVIRONMENT}.tfvars"
            }
        }
       
        stage('Terraform Apply') {
            steps {
                sh "terraform apply -var-file=environments/${params.ENVIRONMENT}.tfvars -auto-approve"
            }
        }
}
}
