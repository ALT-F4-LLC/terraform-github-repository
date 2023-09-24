data "github_team" "self" {
  count = var.team_slug != null ? 1 : 0

  slug = var.team_slug
}
