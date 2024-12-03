pipeline {
    agent any

    parameters {
        gitParameter(
            name: 'BRANCH',
            type: 'PT_BRANCH',
            branch: '',
            defaultValue: 'main',
            description: 'Select Git Branch',
            useRepository: 'https://github.com/mkranthi/aws-iac.git'
        )
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'prod'], description: 'Choose Environment')
        choice(name: 'ACTION', choices: ['PLAN', 'DESTROY'], description: 'Choose Action') // Removed APPLY
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', 
                    branches: [[name: "${params.BRANCH}"]], 
                    userRemoteConfigs: [[url: 'https://github.com/mkranthi/aws-iac.git']]
                ])
            }
        }

        stage('Print Branch Name') {
            steps {
                sh "echo Branch name is ${params.BRANCH}"
            }
        }

        stage('Setup Environment') {
            steps {
                script {
                    // Set the environment variables for Terraform
                    sh "export TF_VAR_ENVIRONMENT=${params.ENVIRONMENT}"
                    env.STATE_FILE = "terraform/${params.ENVIRONMENT}.tfstate"
                    env.VAR_FILE = "${params.ENVIRONMENT}.tfvars"
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh """
                    terraform init \
                        -reconfigure \
                        -backend-config="bucket=kranti-terraform-statefile" \
                        -backend-config="key=terraform/${env.STATE_FILE}"
                """
            }
        }

        stage('Terraform Plan') {
            when {
                expression { params.ACTION == 'PLAN' }
            }
            steps {
                sh """
                    terraform plan -var-file=${env.VAR_FILE}
                """
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'DESTROY' }
            }
            steps {
                sh """
                    terraform destroy -auto-approve -var-file=${env.VAR_FILE}
                """
            }
        }
    }
}
