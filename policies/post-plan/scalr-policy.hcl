version = "v1"

policy "no_deletes" {
  enabled           = true
  enforcement_level = "hard-mandatory"
}

policy "advisory_41350" {
  enabled           = true
  enforcement_level = "advisory"
}

policy "max_creates" {
  enabled           = true
  enforcement_level = "soft-mandatory"
}
