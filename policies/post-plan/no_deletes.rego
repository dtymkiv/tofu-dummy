package terraform

deny[reason] {
  r := input.tfplan.resource_changes[_]
  r.change.actions[_] == "delete"
  reason := sprintf("%s: deleting resources is not allowed", [r.address])
}
