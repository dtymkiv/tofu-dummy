package terraform

deny[reason] {
  creates := [r | r := input.tfplan.resource_changes[_]; r.change.actions[_] == "create"]
  count(creates) > 500
  reason := sprintf("plan creates %d resources, the limit is 500", [count(creates)])
}
