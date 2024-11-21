
pipeline {
    agent any
    parameters {
        // Git Parameter for branch selection
        gitParameter(
            name: 'BRANCH',
            branchFilter: 'origin/(.*)',  // Regex to match branches
            defaultValue: 'master',  // Default branch
            type: 'PT_BRANCH',  // Parameter Type: Branch
            description: 'Select the branch to build from'
        )
        
        // Choice Parameter for selecting environment
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'prod'], description: 'Choose Environment')
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the selected branch
                    echo "Checking out branch: ${params.BRANCH}"
                    git branch: "${params.BRANCH}", url: 'https://github.com/mkranthi/aws-iac.git'
                }
            }
        }

        stage('Terraform Init') {
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
                sh "terraform apply -var-file=${params.ENVIRONMENT}.tfvars -auto-approve"
            }
        }
    }
}
