terraform {
    backend "s3" {
        bucket = "new_project-"
        region = "us-east-1"
        key = "new_project/virginia/terraform.tfstate"
        dynamodb_table = "new_project-virginia-state-lock"
    }
} 