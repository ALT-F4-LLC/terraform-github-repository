resource "github_team_repository" "self" {
  count = var.team_slug != null ? 1 : 0

  permission = "admin"
  repository = github_repository.self.name
  team_id    = data.github_team.self[0].id
}

resource "github_repository" "self" {
  allow_auto_merge       = var.allow_auto_merge
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_squash_merge     = var.allow_squash_merge
  auto_init              = true
  delete_branch_on_merge = true
  description            = var.description
  gitignore_template     = var.gitignore_template
  has_discussions        = var.has_discussions
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  is_template            = false
  license_template       = var.license_template
  name                   = var.name
  topics                 = var.topics
  visibility             = var.visibility
  vulnerability_alerts   = var.vulnerability_alerts
}

resource "github_branch_protection" "self" {
  allows_deletions                = false
  allows_force_pushes             = false
  count                           = try(var.has_branch_protection ? 1 : 0, 1)
  enforce_admins                  = true
  pattern                         = "main"
  repository_id                   = github_repository.self.node_id
  require_conversation_resolution = true
  require_signed_commits          = false
  required_linear_history         = true

  required_status_checks {
    contexts = var.required_status_checks_contexts
    strict   = length(var.required_status_checks_contexts) > 0 ? true : false
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 0
  }
}

moved {
  from = github_branch_protection.self
  to   = github_branch_protection.self[0]
}
