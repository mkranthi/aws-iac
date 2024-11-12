
pipeline {
    agent any 
    stages {
        stage ('checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/mkranthi/aws-iac.git'
            }
        }
        stage('executing terraform init') {
            steps {
                sh 'terraform init'
    }
}
        stage('executing terraform refresh') {
            steps {
                sh 'terraform refresh'
    }
}
        stage('executing terraform paln') {
            steps {
                sh 'terraform plan'
    }
}

        stage('executing terraform apply') {
            steps {
                sh 'terraform destroy -auto-approve'
    }
}
        
}
}