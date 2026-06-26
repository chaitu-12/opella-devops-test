pipeline {

    agent any

    environment {

        TF_IN_AUTOMATION = "true"
        TF_INPUT = "false"

        WORKING_DIR = "environments/dev"

    }

    options {

        timestamps()

        ansiColor('xterm')

    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm

            }

        }

        stage('Terraform Format') {

            steps {

                dir("${WORKING_DIR}") {

                    sh 'terraform fmt -check -recursive'

                }

            }

        }

        stage('Terraform Init') {

            steps {

                dir("${WORKING_DIR}") {

                    sh 'terraform init'

                }

            }

        }

        stage('Terraform Validate') {

            steps {

                dir("${WORKING_DIR}") {

                    sh 'terraform validate'

                }

            }

        }

        stage('TFLint') {

            steps {

                dir("${WORKING_DIR}") {

                    sh 'tflint'

                }

            }

        }

        stage('tfsec Security Scan') {

            steps {

                dir("${WORKING_DIR}") {

                    sh 'tfsec .'

                }

            }

        }

        stage('Terraform Plan') {

            steps {

                dir("${WORKING_DIR}") {

                    sh 'terraform plan -out=tfplan'

                }

            }

        }

        stage('Approval') {

            steps {

                input message: 'Deploy Infrastructure?'

            }

        }

        stage('Terraform Apply') {

            steps {

                dir("${WORKING_DIR}") {

                    sh 'terraform apply -auto-approve tfplan'

                }

            }

        }

    }

    post {

        always {

            cleanWs()

        }

        success {

            echo 'Terraform deployment completed successfully.'

        }

        failure {

            echo 'Terraform deployment failed.'

        }

    }

}