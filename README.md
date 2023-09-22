:large_blue_circle: DevOps project to deploy a running application in AWS ECS service.

# Required resources:
1. A simple Node application in local PC (Application should render static site/content, no
database connection needed)
2. An AWS account (personal account)

# Project Steps:
1. Run the Node application in local PC
2. Create Docker environment
  - Create Dockerfile
  - Copy project files in Docker container
  - Run the the project from Docker file
  - See the output from local browser
3. Push the Node application to Github repository.
4. Create an account in AWS console
5. Create ECS environment [ All sub-steps under this step can be implemented from AWS
  console ]
  - Create Task Definition
  - Create Cluster
  - Create Service
  - Run the task
  - See the output from any PC using public IP
6. Use Github Actions workflow to build an image, push it to ECR, and then download and
push an updated task definition to AWS to deploy the latest code to ECS.
7. Prepare a manual of work done
  a) Write down all the steps done to complete the task [ With screenshots ]
  b) Write down how to test the output [ with screenshots ]

# GitHub action workflow

![image](https://user-images.githubusercontent.com/70535896/225723016-717ef34e-5228-4bd0-af8e-ffe6f75f7696.png)

# Final deployed application

![image](https://user-images.githubusercontent.com/70535896/225723300-db51dac3-f8ee-451a-ac9b-08309ed6e238.png)
