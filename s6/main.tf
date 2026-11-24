# Scenario 6 fixture: every listed value is near the 1024-character cap of the PR comment.
locals {
  pad  = join("", [for j in range(100) : "abcdefghij"])
  keys = toset([for i in range(20) : format("%02d-%s", i, local.pad)])
}

resource "random_pet" "replace" {
  for_each = local.keys
  prefix   = "r${local.pad}"
  keepers  = { v = "v2" }
}

resource "terraform_data" "update" {
  for_each = local.keys
  input    = "v2"
}

resource "terraform_data" "create" {
  for_each = local.keys
}
# rerun with size-budget comment code
