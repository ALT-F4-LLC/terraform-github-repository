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
