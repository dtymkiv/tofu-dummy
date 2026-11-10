variable "n" { default = 50 }

resource "terraform_data" "create" { count = var.n }
resource "terraform_data" "update" {
  count = var.n
  input = "v1"
}
resource "terraform_data" "replace" {
  count            = var.n
  triggers_replace = "v1"
}
resource "terraform_data" "delete" { count = 0 }

output "out" { value = { for i in range(var.n) : "k${i}" => "v2-${i}" } }
output "o_new"  { value = "added" }