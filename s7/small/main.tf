module "api" {
  source      = "../modules/service"
  name        = "api"
  instances   = 2
  app_version = "1.4.0"
}

module "worker" {
  source      = "../modules/service"
  name        = "worker"
  instances   = 2
  app_version = "1.4.0"
}

resource "terraform_data" "dns" {
  for_each = toset(["api.example.com"])
  input    = each.key
}

resource "random_pet" "deploy_id" {
  keepers = { release = "2026.11" }
}

output "api_endpoint" { value = "https://api.example.com/v1" }
