pipeline {
    agent any 
    parameters {
        
        // Git Parameter for selecting a branch
        gitParameter(
            name: 'BRANCH', 
            branchFilter: 'origin/(.*)', 
            defaultValue: 'feature', 
            type: 'PT_BRANCH', 
            description: 'Select the branch to build from'
        )
           // Choice Parameter for selecting environment
           choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'prod'], description: 'Choose Environment')
    }
    stages {
        stage ('checkout') {
            steps {
                script {
                    // Checkout the selected Git branch
                    echo "Checking out branch: ${params.BRANCH}"
                    git branch: "${params.BRANCH}", url: 'https://github.com/mkranthi/aws-iac.git'
                }
            }
        }

        stage('executing terraform init') {
            steps {
                sh 'terraform init -migrate-state' 
            }
        }

        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=${params.ENVIRONMENT}.tfvars"
            }
        }
       
        stage('Terraform Apply') {
            steps {
                sh "terraform destroy -var-file=${params.ENVIRONMENT}.tfvars -auto-approve"
            }
        }
    }
}

