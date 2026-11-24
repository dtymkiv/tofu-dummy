module "api" {
  source      = "../modules/service"
  name        = "api"
  instances   = 2
  app_version = "1.5.0"
}

module "worker" {
  source      = "../modules/service"
  name        = "worker"
  instances   = 1
  app_version = "1.4.0"
}

resource "terraform_data" "dns" {
  for_each = toset(["api.example.com", "worker.example.com"])
  input    = each.key
}

resource "random_pet" "deploy_id" {
  keepers = { release = "2026.12" }
}

output "api_endpoint" { value = "https://api.example.com/v2" }
output "worker_endpoint" { value = "https://worker.example.com" }
# rerun: 50-row split
