resource "github_team_repository" "self" {
  count = length(keys(var.teams))

  permission = var.teams[keys(var.teams)[count.index]]
  repository = github_repository.self.name
  team_id    = keys(var.teams)[count.index]
}

resource "github_repository" "self" {
  allow_auto_merge       = var.allow_auto_merge
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_squash_merge     = var.allow_squash_merge
  archive_on_destroy     = var.archive_on_destroy
  auto_init              = true
  delete_branch_on_merge = true
  description            = var.description
  gitignore_template     = var.gitignore_template
  has_discussions        = var.has_discussions
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  homepage_url           = var.homepage_url
  is_template            = false
  license_template       = var.license_template
  name                   = var.name
  topics                 = var.topics
  visibility             = var.visibility
  vulnerability_alerts   = var.vulnerability_alerts

  dynamic "pages" {
    for_each = var.enable_pages ? [1] : []

    content {
      build_type = var.pages_build_type
      cname      = var.pages_cname

      source {
        branch = var.pages_branch
        path   = var.pages_path
      }
    }
  }
}

resource "github_branch_protection" "self" {
  count = try(var.has_branch_protection ? 1 : 0, 1)

  allows_deletions                = false
  allows_force_pushes             = false
  enforce_admins                  = var.enforce_admins
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
    dismiss_stale_reviews           = var.dismiss_stale_reviews
    required_approving_review_count = var.required_approving_review_count
  }
}

resource "github_repository_webhook" "self" {
  for_each = { for webhook_key, webhook in var.webhooks : webhook_key => webhook }

  active     = each.value.active
  events     = each.value.events
  repository = github_repository.self.name

  configuration {
    content_type = each.value.content_type
    insecure_ssl = false
    url          = each.value.url
  }
}
