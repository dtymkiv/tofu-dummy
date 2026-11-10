package terraform

deny[reason] {
  not regex.match("^[0-9a-z-]+$", input.tfrun.workspace.name)
  reason := sprintf("workspace name %q must be lowercase letters, digits and dashes", [input.tfrun.workspace.name])
}
