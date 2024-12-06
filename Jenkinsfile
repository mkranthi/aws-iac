pipeline {
    agent any

    parameters {
        // List Git Branches Parameter
        listGitBranches(
            name: 'BRANCH',                        // Parameter name
            defaultValue: 'main',                  // Default branch
            description: 'Select a Git branch',    // Description for the parameter
            remoteURL: 'https://github.com/mkranthi/aws-iac.git' // Git repository URL
        )
        choice(
            name: 'ENVIRONMENT', 
            choices: ['dev', 'test', 'prod'], 
            description: 'Choose the environment to deploy'
        )
        choice(
            name: 'ACTION', 
            choices: ['APPLY', 'DESTROY'], 
            description: 'Choose Terraform action'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Selected Branch: ${params.BRANCH}"

                    // Perform the checkout dynamically based on the selected branch
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: "${params.BRANCH}"]],
                        userRemoteConfigs: [[url: 'https://github.com/mkranthi/aws-iac.git']]
                    ])
                }
            }
        }

        stage('Debug Branch') {
            steps {
                echo "Checked out to branch: ${params.BRANCH}"
            }
        }

        stage('Setup Environment') {
            steps {
                script {
                    echo "Setting up environment: ${params.ENVIRONMENT}"
                    
                    // Set Terraform environment variables
                    env.TF_VAR_ENVIRONMENT = "${params.ENVIRONMENT}"
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
                        -backend-config="key=${env.STATE_FILE}"
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

    post {
        always {
            echo "Pipeline completed for branch: ${params.BRANCH} and environment: ${params.ENVIRONMENT}"
        }
    }
}
