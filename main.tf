resource "random_pet" "pets" {
  count = 5

  keepers = {
    name = "I want to see ${formatdate("YYYYMMDDhhmmss", timestamp())} hot loads"
  }
}
