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
        stage('Authenticate with AWS') {
            steps {
                script {
                    sh """
                    aws configure set default.region ${AWS_REGION}
                    aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                    """
                }
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                script {
                    def image = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}:latest"
                    echo "Updating deployment ${DEPLOYMENT_NAME} with image ${image}"
                    
                    sh """
                    kubectl set image deployment/${DEPLOYMENT_NAME} ${CONTAINER_NAME}=${image} --namespace=${K8S_NAMESPACE}
                    kubectl rollout status deployment/${DEPLOYMENT_NAME} --namespace=${K8S_NAMESPACE}
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}