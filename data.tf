data "github_team" "self" {
  count = length(keys(var.teams))

  slug = keys(var.teams)[count.index]
}
