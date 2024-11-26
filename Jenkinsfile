pipeline {
    agent any 

    parameters {
        choice(name: 'BRANCH', choices: ['develop', 'feature', 'feature-init', 'feature-export'], description: 'Select Branch')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'dev1', 'prod'], description: 'Choose Environment')
        choice(name: 'ACTION', choices: ['APPLY', 'DESTROY'], description: 'Choose Action')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mkranthi/aws-iac.git', branch: "${params.BRANCH}"
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
                sh """
                    terraform plan
                """
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                script {
                    if (params.ACTION == 'APPLY') {
                        sh """
                            terraform apply -auto-approve
                        """
                    } else if (params.ACTION == 'DESTROY') {
                        sh """
                            terraform destroy -auto-approve
                        """
                    }
                }
            }
        }
    }
}