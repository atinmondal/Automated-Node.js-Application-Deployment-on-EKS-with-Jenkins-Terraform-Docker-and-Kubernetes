@Library('my-shared-library') _
pipeline{
    agent any
    tools{
        jdk  'jdk11'
        maven  'maven3'
    }

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose Create/Destroy')
        string(name:'ImageName',description: 'Name of the docker build', defaultValue: 'javaapp')
        string(name:'ImageTag',description: 'Tag of the docker build', defaultValue: 'v1')
        string(name:'dockerHubUser',description: 'Name of the Application', defaultValue: 'atinspandan')
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

        // stage('Unit Test Maven'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             mvnTest()
        //         }
        //     }
        // }

        // stage('Integration Test Maven'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             mvnIntegrationTest()
        //         }
        //     }
        // }

        // stage('Static code analysis: Sonarqube'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             def SonarQubeCredentialsId = 'sonarqube-api'
        //             staticCodeAnalysis(SonarQubeCredentialsId)
        //         }
        //     }
        // }

        // stage('Quality Gate Status Check: Sonarqube'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             def SonarQubeCredentialsId = 'sonarqube-api'
        //             qualityGateStatus(SonarQubeCredentialsId)
        //         }
        //     }
        // }

        // stage('Maven Build'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             mvnBuild()
        //         }
        //     }
        // }

        stage('Docker Image Build'){
        when { expression { params.action == 'create'}}
            steps{
                script{

                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.dockerHubUser}")
                }
            }
        }

        // stage('Docker Image Scan Using Trivy'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{

        //             dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.dockerHubUser}")
        //         }
        //     }
        // }
        // stage('Docker Image Scan Push: DockerHub'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             def DockerHubCred = 'docker-cred'
        //             dockerImagePush(DockerHubCred, "${params.ImageName}","${params.ImageTag}","${params.dockerHubUser}")
        //         }
        //     }
        // }

        // stage('Docker Image CleanUp'){
        // when { expression { params.action == 'create'}}
        //     steps{
        //         script{
        //             dockerImageCleanup("${params.ImageName}","${params.ImageTag}","${params.dockerHubUser}")
        //         }
        //     }
        // }
    }
}