pipeline {
  agent any
  parameters {
    choice(name: 'select_environment', choices: ['dev', 'test', 'prod','dev1'], description: 'Choose one')
    gitParameter branchFilter: 'origin/(.*)', defaultValue: 'main', name: 'BRANCH', type: 'PT_BRANCH', useRepository: '.*Application.git'
   /// environment {
      //develop= 'develop'
      //test='test'
      //prod='prod'
     //}
  }
  stages {
    stage('Example') {
      steps {
         echo "Branch Choice: ${params.select_environment}"
        git branch: "${params.BRANCH}", url: 'https://github.com/mkranthi/Application.git'
      }
    }
    stage('selcet environment'){
        steps{
            script{
            if (env.select_environment == 'dev1'){
                echo ' hello from dev1 '
                script {
                    sh '''
                    #!/bin/bash
                    config=$(jq '.dev1.ip' config.json | sed 's/"//g')
                    echo $config
                    ssh -i /tmp/id_rsa ec2-user@$config -o StrictHostKeyChecking=no << EOF
                    touch samplefile
                    exit 0
                    << EOF
                    '''
                }
            }                      
            if (env.select_environment == 'dev'){
                echo ' hello from dev'
                script {
                    sh '''
                    #!/bin/bash
                    config=$(jq '.dev1.ip' config.json | sed 's/"//g')
                    echo $config
                    ssh -i /tmp/id_rsa ec2-user@$config -o StrictHostKeyChecking=no << EOF
                    touch dev1.ip
                    exit 0
                    << EOF
                    '''
                }
            }
            if (env.select_environment == 'test'){
                echo ' hello from dev'
                script {
                    sh '''
                    #!/bin/bash
                    config=$(jq '.test.ip' config.json | sed 's/"//g')
                    echo $config
                    ssh -i /tmp/id_rsa ec2-user@$config -o StrictHostKeyChecking=no << EOF
                    touch sampletestfile
                    exit 0
                    << EOF
                    '''
                }
            }
            if (env.select_environment == 'prod'){
                echo ' hello from dev'
                script {
                    sh '''
                    #!/bin/bash
                    config=$(jq '.prod.ip' config.json | sed 's/"//g')
                    echo $config
                    ssh -i /tmp/id_rsa ec2-user@$config -o StrictHostKeyChecking=no << EOF
                    touch prodfile
                    exit 0
                    << EOF
                    '''
                }
            }
            else {
                        sh "echo 'Hello from ${env.BRANCH_NAME} branch!'"
                        }
        }     
    }
        }
  }
}
