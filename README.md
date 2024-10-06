# Cloud Infrastructure Automation with Terraform and Jenkins

## Overview

This project demonstrates the automation of cloud infrastructure deployment on AWS using **Terraform** and **Jenkins**. It includes the setup of essential components such as VPC, subnets, security groups, load balancers, and RDS databases, as well as the deployment of games running in Docker containers.

## Project Highlights

- **Infrastructure Components**:
  - **VPC**: A secure Virtual Private Cloud.
  - **Subnets**: Public and private subnets for efficient resource management.
  - **Route Tables**: Custom route tables for controlled traffic flow.
  - **Internet Gateway**: Enables internet access for public resources.
  - **Auto Scaling Groups**: Automatically adjusts the number of EC2 instances based on traffic.
  - **Load Balancer**: Distributes incoming traffic across multiple EC2 instances.
  - **Launch Configurations**: Defines instance launch parameters for auto-scaling.
  - **S3 Bucket**: Stores logs for monitoring and troubleshooting.
  - **RDS (MySQL)**: A highly available relational database for data storage.
  - **Docker Containers**: Deployed games running inside containers for easy scaling.

## Technologies Used

- **Terraform**: Infrastructure as Code (IaC) tool for provisioning cloud resources.
- **Jenkins**: Continuous Integration and Continuous Deployment (CI/CD) server for automating workflows.
- **AWS**: Cloud platform for hosting the infrastructure.
- **Docker**: Containerization technology for deploying applications.

## Prerequisites

Before running this project, ensure you have the following:

- An AWS account.
- Terraform installed on your local machine.
- Jenkins installed and configured on an EC2 instance.
- AWS CLI configured with access to your account.

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/vikas-patial/Terraform-Jenkins-repo.git
cd Terraform-Jenkins-repo
