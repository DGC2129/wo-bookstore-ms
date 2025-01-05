pipeline {
    agent any
    environment {
        AWS_REGION = 'us-west-1' // Replace with your AWS region
        EKS_CLUSTER_NAME = 'my-eks-cluster' // Replace with your EKS cluster name
        ECR_REGISTRY = '600627363311.dkr.ecr.us-east-1.amazonaws.com' // Replace with your ECR registry URL
        ECR_REPOSITORY = 'myrepo' // Replace with your ECR repository name
        IMAGE_TAG = 'latest' // Replace with the desired image tag
        DEPLOYMENT_FILE = 'k8s/deployment.yaml' // Path to your Kubernetes deployment manifest.
    }
    stages {
        stage('Authenticate with ECR') {
            steps {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-credentials-id', usernameVariable: 'AKIAYXWBOHXXUWBJIRBR', passwordVariable: 'xjyKI4G47pV7IJQbCoCw75dhB1GNdXsJThbAazHr')])
                    sh 'aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}'
                }
            }
        }
        stage('Pull ECR Image') {
            steps {
                script {
                        sh 'docker pull ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest'
                }
            }
        }
        stage('Configure kubectl for EKS') {
            steps {
                script {
                    sh """
                        aws eks update-kubeconfig --region $AWS_REGION --name $EKS_CLUSTER_NAME
                    """
                }
            }
        }
        stage('Deploy to EKS') {
            steps {
                script {
                    sh """
                        kubectl apply -f $DEPLOYMENT_FILE
                    """
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution completed!'
        }
        success {
            echo 'Deployment to EKS was successful!'
        }
        failure {
            echo 'Deployment failed. Check the logs for errors.'
        }
    }
}
