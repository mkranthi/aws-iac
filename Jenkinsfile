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
                    env.STATE_FILE = "terraform_${params.ENVIRONMENT}.tfstate"
                    env.VAR_FILE = "${params.ENVIRONMENT}.tfvars"
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh """
                    terraform init \
                        -reconfigure \
                        -backend-config="bucket=<your-s3-bucket-name>" \
                        -backend-config="key=${env.STATE_FILE}" \
                        -backend-config="region=<your-region>" \
                        -var-file=${env.VAR_FILE}
                """
            }
        }

        stage('Terraform Plan') {
            when {
                expression { params.ACTION == 'APPLY' }
            }
            steps {
                sh "terraform plan -var-file=${env.VAR_FILE}"
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
