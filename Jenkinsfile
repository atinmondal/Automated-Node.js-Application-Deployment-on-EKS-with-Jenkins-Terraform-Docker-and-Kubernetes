@Library('my-shared-library') _
pipeline{
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose Create/Destroy')
        string(name:'aws_account_id',description: 'AWS account Id', defaultValue: '243731798106')
        string(name:'region',description: 'Region of the ECR', defaultValue: 'us-east-1')
        string(name:'ecrRepositoryName',description: 'Name of the ECR', defaultValue: 'jenkins-pipeline')
        string(name:'eksClusterName',description: 'Name of the EKS cluster', defaultValue: 'eks-cluster1')
    }

    environment{
        ACCESS_KEY = credentials('Access_key_ID')
        SECRET_KEY = credentials('Secret_access_key')
    }

    stages{
        stage('Git Checkout'){
        when { expression { params.action == 'create'}}
            steps{
                gitCheckout(
                    branch: "main",
                    url: "https://github.com/atinmondal/Jenkins_pipeline_nodejsApplication.git"
                )
            }
        }
        // stage('Docker Image Build'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{

        //             dockerBuild("${params.aws_account_id}","${params.region}","${params.ecrRepositoryName}")
        //         }
        //     }
        // }

        // stage('Docker Image Scan Using Trivy'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{

        //             dockerImageScan("${params.aws_account_id}","${params.region}","${params.ecrRepositoryName}")
        //         }
        //     }
        // }
        // stage('Docker Image Push To ECR'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             dockerImagePush("${params.aws_account_id}","${params.region}","${params.ecrRepositoryName}")
        //         }
        //     }
        // }

        // stage('Docker Image CleanUp From Local System'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             dockerImageCleanup("${params.aws_account_id}","${params.region}","${params.ecrRepositoryName}")
        //         }
        //     }
        // }

        stage('Create EKS Cluster: Terraform'){
        when { expression { params.action == 'create'}}
            steps{
                script{
                    dir('EKS_module\\project') {
                        sh """
                            terraform destroy -var 'access_key=${ACCESS_KEY}' -var 'secret_key=${SECRET_KEY}' -var 'region=${params.region}' --var-file=../config/terraform.tfvars -auto-approve
                        """
                    }
                }
            }
        }

    //     stage('Connect To EKS'){
    //     when { expression { params.action == 'create'}}
    //         steps{
    //             script{
    //                 sh """
    //                     aws eks --region ${params.region} update-kubeconfig --name ${params.eksClusterName}
    //                 """
    //             }
    //         }
    //     }

    //     stage('Deployment of Node.js Image on EKS Cluster'){
    //     when { expression { params.action == 'create'}}
    //         steps{
    //             script{
    //                 def apply = false

    //                 try{
    //                     input message: 'Please confirm to deploy on EKS', ok: 'Ready to apply the config ?'
    //                     apply = true
    //                 }catch(err){
    //                     apply = false
    //                     currentBuild.result = 'UNSTABLE'
    //                 }
    //                 if (apply){

    //                     sh """
    //                         kubectl apply -f .
    //                     """
    //                 }
    //             }
    //         }
    //     }

    }
}