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
        choice(name: 'ACTION', choices: ['PLAN', 'APPLY', 'DESTROY'], description: 'Choose Action')
    }
    stages {
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
                    sh "export TF_VAR_ENVIRONMENT=${params.ENVIRONMENT}"

                    // Dynamically set state and var files
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
                        -backend-config="key=terraform/${env.BRANCH_NAME}/${env.STATE_FILE}"
                """
            }
        }

        stage('Terraform Plan') {
            when {
                expression { params.ACTION in ['PLAN', 'APPLY'] }
            }
            steps {
                sh """
                    terraform plan -var-file=${env.VAR_FILE} 
                """
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.ACTION == 'APPLY' }
            }
            steps {
                sh """
                    terraform apply -auto-approve -var-file=${env.VAR_FILE}
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
