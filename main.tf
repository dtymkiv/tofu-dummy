resource "terraform_data" "x" {
  for_each = toset(["a```</details>\"q\"", "plain"])
}
output "o" { value = "safe" }
