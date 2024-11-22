Terraform EC2 Instance Deployment Using Jenkins
This repository contains Terraform code to create an AWS EC2 instance with an already existing IAM role used as an instance profile. The deployment is managed through Jenkins with options to specify the branch and environment as parameters.

Features
Creates an EC2 instance in AWS.
Attaches an existing IAM role as an instance profile for the EC2 instance.
Supports parameterized deployment via Jenkins, allowing dynamic selection of:
Git Branch: Specify the branch to pull Terraform code from.
Environment: Choose the target environment (e.g., dev, staging, prod).
