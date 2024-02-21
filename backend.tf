terraform {
    backend "s3" {
        bucket = "terraform-backend-raya"
        region = "us-east-1"
        key = "new_project/terraform.tfstate"
        #dynamodb_table = "terraform-session-sep-state-lock"
    }
} 
# The region field in the Terraform S3 backend configuration specifies the AWS region where the S3 bucket for storing the Terraform state is located, not the regions where your resources will be deployed. This is a common point of confusion.