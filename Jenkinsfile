pipeline {
    agent any

    parameters {
        gitParameter(
            name: 'BRANCH',
            type: 'PT_BRANCH',
            defaultValue: 'main',
            description: 'Select Git Branch',
            useRepository: 'https://github.com/mkranthi/aws-iac.git'
        )
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'test', 'prod'], description: 'Choose Environment')
        choice(name: 'ACTION', choices: ['APPLY', 'DESTROY'], description: 'Choose Action')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Selected Branch: ${params.BRANCH}"
                    checkout([$class: 'GitSCM',
                              branches: [[name: "${params.BRANCH.startsWith('origin/') ? params.BRANCH.replace('origin/', '') : params.BRANCH}"]],
                              userRemoteConfigs: [[url: 'https://github.com/mkranthi/aws-iac.git']]])
                }
            }
        }

        stage('Printing Branch Name') {
            steps {
                sh "echo Branch name is ${params.BRANCH}"
            }
        }

        stage('Setup Environment') {
            steps {
                script {
                    // Set the environment variables for Terraform
                    sh "export TF_VAR_ENVIRONMENT=${params.ENVIRONMENT}"

                    // Dynamically set the state file and variable file names
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
                expression { params.ACTION == 'APPLY' }
            }
            steps {
                sh """
                    terraform plan -var-file=${env.VAR_FILE}
                """
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'APPLY') {
                        sh """
                            terraform apply -auto-approve -var-file=${env.VAR_FILE}
                        """
                    } else if (params.ACTION == 'DESTROY') {
                        sh """
                            terraform destroy -auto-approve -var-file=${env.VAR_FILE}
                        """
                    }
                }
            }
        }
    }
}
