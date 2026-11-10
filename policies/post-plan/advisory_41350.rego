package terraform

deny["cost-center tag is missing on this workspace"] {
  input.tfrun.workspace.name == "41350"
}
