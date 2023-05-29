resource "github_team_repository" "self" {
  permission = "admin"
  repository = github_repository.self.name
  team_id    = data.github_team.self.id
}
