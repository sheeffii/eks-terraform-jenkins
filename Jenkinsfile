pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage('Checkout SCM'){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sheeffii/eks-terraform-jenkins']])
                }
            }
        }
        stage('Terraform EKS Cluster'){
            steps{
                dir('eks-cluster'){
                    sh 'terraform init'
                    sh 'terraform $action --auto-approve'
                }
            }
        }
        stage('Deploying Nginx Application') {
            steps{
                script{
                    dir('eks-cluster/ConfigFiles') {
                        sh 'aws eks update-kubeconfig --name shefqet-eks-cluster'
                        sh 'kubectl apply -f deployment.yaml'
                        sh 'kubectl apply -f service.yaml'
                    }
                }
            }
        }
    }
}
