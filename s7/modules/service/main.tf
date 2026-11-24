variable "name" { type = string }
variable "instances" { type = number }
variable "app_version" { type = string }

resource "random_id" "suffix" {
  byte_length = 4
}

resource "terraform_data" "instance" {
  count = var.instances
  input = {
    name    = "${var.name}-${count.index}-${random_id.suffix.hex}"
    version = var.app_version
  }
}

resource "terraform_data" "config" {
  input = var.app_version
}
