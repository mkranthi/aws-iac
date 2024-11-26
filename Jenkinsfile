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
        choice(name: 'ACTION', choices: ['APPLY', 'DESTROY'], description: 'Choose Action')
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

        stage('Setup Environment') {
            steps {
                script {
                    // Export the environment variable for TF_VAR_<VARIABLE_NAME>
                    sh "export TF_VAR_ENVIRONMENT=${params.ENVIRONMENT}"
                    env.STATE_FILE = "terraform_${params.ENVIRONMENT}.tfstate"
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
            steps {
                // No need to pass -var-file or -var, Terraform automatically picks up TF_VAR_ENVIRONMENT
                sh "terraform plan"
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'APPLY') {
                        sh "terraform apply -auto-approve"
                    } else if (params.ACTION == 'DESTROY') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
    }
}
