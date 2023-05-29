resource "github_branch_protection" "self" {
  allows_deletions                = false
  allows_force_pushes             = false
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
