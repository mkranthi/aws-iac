pipeline {
    agent any 

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'prod'], description: 'Choose Environment')
        choice (name: 'BRANCH', choices: ['develop', 'feature','feature-init'], description: 'Choose Branch')
    }
    stages {
        stage ('checkout') {
            steps {
                sh "git checkout ${params.BRANCH}"
            }
        }
        stage('Executing terraform init') {
            steps {
                sh 'terraform init -reconfigure'
    }
}
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=${params.ENVIRONMENT}.tfvars"
            }
        }
        stage('Terraform Apply') {
            steps {
               // sh "terraform destroy -var-file=${params.ENVIRONMENT}.tfvars -auto-approve"
               sh """terraform destroy -var-file=${params.ENVIRONMENT}.tfvars -state=${params.ENVIRONMENT}.tfstate -auto-approve"""

            }
        }
              
}
}
