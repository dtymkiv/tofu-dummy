package terraform

deny["workspaces named *-failing are for testing only"] {
  endswith(input.tfrun.workspace.name, "-failing")
}
