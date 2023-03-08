# terraform {
#   backend "s3" {
#     bucket = "elblab2-118369402652-tfstates"
#     key    = "minilabs/elbminilabs3/terraform.tfstates"
#   }
# }

terraform {
  backend "s3" {
    bucket = "elblab2-118369402652-tfstates"
    key    = "minilabs/elbminilab-dynamodb/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}