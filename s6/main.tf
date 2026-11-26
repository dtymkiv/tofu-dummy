# Scenario 6 fixture: every listed value is near the 1024-character cap of the PR comment.
# no-op check: same config as the base state
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
