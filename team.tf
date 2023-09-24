resource "github_team_repository" "self" {
  count = var.team_slug != null ? 1 : 0

  permission = "admin"
  repository = github_repository.self.name
  team_id    = data.github_team.self[0].id
}
