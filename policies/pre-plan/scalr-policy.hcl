version = "v1"

policy "naming" {
  enabled           = true
  enforcement_level = "hard-mandatory"
}

policy "advisory_failing" {
  enabled           = true
  enforcement_level = "advisory"
}
