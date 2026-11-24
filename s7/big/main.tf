module "fleet" {
  source      = "../modules/service"
  name        = "edge"
  instances   = 180
  app_version = "3.3.0"
}

resource "terraform_data" "dns" {
  for_each = toset([for i in range(30) : "edge-${i}.example.com"])
  input    = each.key
}

resource "terraform_data" "cert" {
  for_each         = toset(["edge", "api", "admin", "status", "docs"])
  input            = "${each.key}.example.com"
  triggers_replace = "2027-01"
}

output "edge_count" { value = 180 }
# rerun: spacing fix
