# Multi-Region AWS Infrastructure with GitLab

## Overview
This repository facilitates the automated setup of a robust AWS infrastructure and GitLab installation. It includes the creation and configuration of VPCs, subnets, security groups, EC2 instances, route tables, NAT gateways, Internet Gateways, and Elastic IPs across different AWS regions, managed using a Makefile and Terraform.

## Prerequisites
- Amazon Linux 2: Suitable for GitLab installation  [Installation Guide for Amazon Linux 2](https://about.gitlab.com/install/#amazonlinux-2)

- Memory: Minimum 4 GiB of RAM recommended for GitLab.
AWS Account & CLI: Configured with necessary credentials.
- Terraform: Installed for infrastructure provisioning.

## AWS Infrastructure Setup
## Components
- VPCs & Subnets: Create isolated network environments with public and private subnets.
- Security Groups: Define security rules for EC2 instances.
- EC2 Instances: Provision virtual servers in specified AWS regions.
- Route Tables: Manage network traffic routing for subnets.
- NAT Gateways & Internet Gateways: Facilitate outbound internet access for instances in private subnets and connect the VPC to the internet, respectively.
- Elastic IPs: Allocate static IPv4 addresses for NAT gateways.
- Key Pairs: Generate SSH keys for EC2 instance access.
- Backend Setup (S3, DynamoDB): Configure S3 for state storage and DynamoDB for state locking in Terraform.

## Configuration
Customize the Terraform configuration files (*.tf) to define your AWS infrastructure settings, including resource names, regions, CIDR blocks, and more.

## Makefile Operations
Use the Makefile for efficient multi-region infrastructure management.

- Create Infrastructure: `make <region>`
- Destroy Infrastructure: `make <region>-destroy`
- Replace `<region>` with your target AWS region.

## Usage
Deploy and manage applications across multi-region AWS infrastructure. Utilize GitLab for collaborative development and CI/CD processes.


## Accessing GitLab

After deploying your infrastructure, follow these steps to access your GitLab instance and complete the initial setup:

### Step 1: Obtain the Public IP Address

- Once the deployment is complete, retrieve the public IP address of your GitLab instance from the AWS EC2 console.
- **Note:** It may take up to 5 minutes for the public IP address to appear and for the GitLab service to become fully operational. Please be patient during this period.

### Step 2: Access GitLab through Your Browser

- Open a web browser and navigate to the public IP address of your GitLab instance. 

### Step 3: GitLab Initial Login

- Upon accessing GitLab for the first time, you will be directed to a login page.
- **Username:** The default username for GitLab is `root`.
- **Password Retrieval:** To obtain the initial password for the `root` user, SSH into your GitLab server and execute the following command:

```bash
sudo cat /etc/gitlab/initial_root_password
