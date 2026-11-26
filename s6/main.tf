# Scenario 6 fixture: every listed value is near the 1024-character cap of the PR comment.
# rerun: output diff on the first 50 lines
locals {
  pad  = join("", [for j in range(100) : "abcdefghij"])
  keys = toset([for i in range(20) : format("%02d-%s", i, local.pad)])
}

resource "random_pet" "replace" {
  for_each = local.keys
  prefix   = "r${local.pad}"
  keepers  = { v = "v1" }
}

resource "random_pet" "delete" {
  for_each = local.keys
  prefix   = "d${local.pad}"
}

resource "terraform_data" "update" {
  for_each = local.keys
  input    = "v1"
}

output "instances" {
  value = [for i in range(100) : { name = "web-${i}", ami = i == 80 ? "ami-v2" : "ami-v1", size = "t3.micro" }]
}

output "fleet" {
  value = [for i in range(100) : { name = "node-${i}", ami = "ami-v2" }]
}
