# Scenario 6 fixture: every listed value is near the 1024-character cap of the PR comment.
locals {
  pad  = join("", [for j in range(100) : "abcdefghij"])
  keys = toset([for i in range(20) : format("%02d-%s", i, local.pad)])
}

resource "random_pet" "replace" {
  for_each = local.keys
  prefix   = "r${local.pad}"
  keepers  = { v = "v1" }
}

removed {
  from = random_pet.delete
}

moved {
  from = terraform_data.update
  to   = terraform_data.updated
}

resource "terraform_data" "updated" {
  for_each = local.keys
  input    = "v1"
}

import {
  to = random_id.imported
  id = "p-9hUg"
}

resource "random_id" "imported" {
  byte_length = 4
}
