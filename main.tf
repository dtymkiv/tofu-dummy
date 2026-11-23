variable "n" { default = 50 }

variable "fail_plan" {
  type    = bool
  default = false
}

resource "terraform_data" "fail_switch" {
  lifecycle {
    precondition {
      condition     = !var.fail_plan
      error_message = "Intentional failure to test the PR comment error block."
    }
  }
}

resource "terraform_data" "create" { count = 50 }

resource "terraform_data" "update" {
  count = var.n
  input = count.index < 0 ? "v2" : "v1"
}

resource "terraform_data" "replace" {
  count            = var.n
  triggers_replace = count.index < 0 ? "v2" : "v1"
}

resource "terraform_data" "delete" { count = 7 }

resource "terraform_data" "added" { count = 100 }

output "out" { value = { for i in range(var.n) : "k${i}" => "v2-${i}" } }

output "o_new"  { value = "added" }
