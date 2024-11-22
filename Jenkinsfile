pipeline {
    agent any

    parameters {
        // Parameter to select the branch
        choice(name: 'BRANCH', choices: ['feature-init', 'main', 'develop'], description: 'Select the branch to deploy')
        
        // Parameter to select the environment
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod', 'staging'], description: 'Select the environment for deployment')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the selected branch
                    echo "Checking out branch: ${params.BRANCH}"
                    checkout scm
                    sh "git checkout ${params.BRANCH}"
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    echo "Initializing Terraform..."
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Pass environment-specific variables file
                    def tfVarsFile = "${params.ENVIRONMENT}.tfvars"
                    echo "Running Terraform Plan with ${tfVarsFile}..."
                    sh "terraform plan -var-file=${tfVarsFile}"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def tfVarsFile = "${params.ENVIRONMENT}.tfvars"
                    echo "Running Terraform Apply with ${tfVarsFile}..."
                    sh "terraform destroy -var-file=${tfVarsFile} -auto-approve"
                }
            }
        }
    }
