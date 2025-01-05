pipeline {
    
    agent any
    
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REGISTRY = '600627363311.dkr.ecr.us-east-1.amazonaws.com'
        ECR_REPOSITORY = 'wellsoffice/docker-image-store'	
        //registry = "600627363311.dkr.ecr.us-east-1.amazonaws.com/wellsoffice/docker-image-store"
    }
    
    stages {
        
        stage ('checkout') {
            steps {
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/DGC2129/DockerTest.git']])
            sh 'pwd'
            sh 'ls -lrt'
            }
        }
        stage('Login to ECR') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-credentials-id', usernameVariable: 'AKIAYXWBOHXX4ITZ66GC', passwordVariable: 'vqJul7WcL4QRQIfy1WGHKt3r3ND0B/jUq5IiKuId')])
                    sh 'aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}'
                }
            }
        
        stage('Pull Docker Image') {
            steps {
                sh 'docker pull ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest'
            }
        }		
        
        stage ('Docker Build Stage'){
            steps {
                script {
                    // sh 'docker login -u gopidevopskanna -p Devops989'
                 //   sh 'aws ecr get-login-password --region region | docker login --username AWS --password-stdin 600627363311.dkr.ecr.region.amazonaws.com'
                    //sh "docker pull 600627363311.dkr.ecr.us-east-1.amazonaws.com/wellsoffice/docker-image-store:latest"
                    sh 'docker build -t ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest .'
                }
            }
        }
        
        stage ('Docker Push') {
            steps {
                script{
                        sh 'aws ecr get-login-password --region region | docker login --username AWS --password-stdin ${ECR_REGISTRY}'
                        sh 'docker push ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest'
                    }    
                }
            }
            
        stage ('Doker Run') {
            steps {
                script {
                    sh 'docker run --rm -d -p 8000:80 --name wellsoffice-ecr-image ${ECR_REGISTRY}/${ECR_REPOSITORY}:latest'
                    }
                }
            }
        }
    }    