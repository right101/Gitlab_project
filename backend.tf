# terraform {
#     backend "s3" {
#         bucket = "terraform-backend-raya"
#         region = "us-east-1"
#         key = "new_project/virginia/terraform.tfstate"
#         dynamodb_table = "terraform-session-sep-state-lock"
#     }
# } 