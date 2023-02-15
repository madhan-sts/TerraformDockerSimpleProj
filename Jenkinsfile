pipeline{
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Cloning Repo') {
            steps {
                echo 'Cloning..'
                bat "git clone https://github.com/madhan-sts/TerraformDockerSimpleProj.git"

            }
        }
        stage('Terraform Version') {
            steps {
                bat 'terraform --version'
            }
        }
        stage('Terraform init') {
            steps {
                bat '''
                    cd TerraformDockerSimpleProj/
                    terraform init
                '''
            }
        }
        stage('Terraform plan'){
            steps{
                bat '''
                    cd TerraformDockerSimpleProj/
                    terraform plan -out=tfplan.out
                    terraform show -json tfplan.out
                '''
            }
        }
        stage('Terraform apply'){
            steps{
                bat '''
                    cd TerraformDockerSimpleProj/
                    terraform apply --auto-approve
                '''
            }
        }
        post { 
            always { 
                cleanWs()
            }
        }
    }
}