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
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'test', 'prod'], description: 'Choose Environment')
        choice(name: 'ACTION', choices: ['APPLY', 'DESTROY'], description: 'Choose Action')
    }

    stages {
        stage('Debug Git Branches') {
            steps {
                script {
                    echo "Listing all available branches from the repository..."
                    sh """
                        git ls-remote --heads https://github.com/mkranthi/aws-iac.git
                    """
                }
            }
        }

        stage('Checkout') {
            steps {
                script {
                    echo "Selected Branch: ${params.BRANCH}"

                    // Corrected checkout configuration
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: "${params.BRANCH}"]],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [
                            [$class: 'WipeWorkspace'], // Cleans workspace before checkout
                            [$class: 'CleanBeforeCheckout'] // Ensures a clean checkout
                        ],
                        userRemoteConfigs: [[url: 'https://github.com/mkranthi/aws-iac.git']]
                    ])
                }
            }
        }

        stage('Printing Branch Name') {
            steps {
                script {
                    echo "Currently checked out to branch: ${params.BRANCH}"
                }
            }
        }

        stage('Setup Environment') {
            steps {
                script {
                    echo "Setting up environment variables for Terraform..."
                    sh "export TF_VAR_ENVIRONMENT=${params.ENVIRONMENT}"

                    // Dynamically set state and variable file names
                    env.STATE_FILE = "terraform/${params.ENVIRONMENT}.tfstate"
                    env.VAR_FILE = "${params.ENVIRONMENT}.tfvars"

                    echo "State File: ${env.STATE_FILE}"
                    echo "Var File: ${env.VAR_FILE}"
                }
            }
        }

        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform..."
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
                echo "Running Terraform Plan for environment: ${params.ENVIRONMENT}..."
                sh """
                    terraform plan -var-file=${env.VAR_FILE}
                """
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'APPLY') {
                        echo "Applying Terraform changes..."
                        sh """
                            terraform apply -auto-approve -var-file=${env.VAR_FILE}
                        """
                    } else if (params.ACTION == 'DESTROY') {
                        echo "Destroying Terraform resources..."
                        sh """
                            terraform destroy -auto-approve -var-file=${env.VAR_FILE}
                        """
                    } else {
                        error "Invalid ACTION selected: ${params.ACTION}"
                    }
                }
            }
        }

        stage('Post Actions') {
            steps {
                echo "Pipeline execution completed for branch: ${params.BRANCH} and environment: ${params.ENVIRONMENT}"
            }
        }
    }
}
