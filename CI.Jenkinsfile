pipeline {
    
    agent any
    
    environment {
        AWS_REGION = 'us-west-1' // Replace with your AWS region
        ECR_REGISTRY = '600627363311.dkr.ecr.us-east-1.amazonaws.com' // Replace with your ECR registry URL
        ECR_REPOSITORY = 'myrepo' // Replace with your ECR repository name
        IMAGE_TAG = 'latest' // Replace with the desired image tag
        DEPLOYMENT_FILE = 'k8s/deployment.yaml' // Path to your Kubernetes deployment manifest
    }
    
    stages {
        
        stage ('checkout stage') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub', url: 'https://github.com/DGC2129/wo-bookstore-ms']])
            }
            
        }
        stage ('Docker Build Stage'){
            steps {
                script {
                    // sh 'docker login -u gopidevopskanna -p Devops989'
                 //   sh 'aws ecr get-login-password --region region | docker login --username AWS --password-stdin 600627363311.dkr.ecr.region.amazonaws.com'
                    //sh "docker pull 600627363311.dkr.ecr.us-east-1.amazonaws.com/wellsoffice/docker-image-store:latest".
                    sh 'docker build -t ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest .'
                }
            }
        }
        stage ('ECR Authentication') {
            steps {
                   withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'echo $USER '
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 600627363311.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker push 600627363311.dkr.ecr.us-east-1.amazonaws.com/myrepo:v1'
                   }
                   
                }
            }
            stage ('Docker Push') {
                steps {
                    script {
                        
                        sh 'docker login -u gopidevopskanna -p Devops989'
                        sh 'docker push gopidevopskanna/bookstore:v1'
                    }
                }
            }
        }
    }    
