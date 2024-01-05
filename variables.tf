variable "allow_auto_merge" {
  default     = false
  description = "Whether to allow auto-merging pull requests"
  type        = bool
}

variable "allow_merge_commit" {
  default     = false
  description = "Whether to allow merge commits"
  type        = bool
}

variable "allow_rebase_merge" {
  default     = true
  description = "Whether to allow rebase merges"
  type        = bool
}

variable "allow_squash_merge" {
  default     = true
  description = "Whether to allow squash merges"
  type        = bool
}

variable "description" {
  description = "The description of the repository"
  type        = string
}

variable "gitignore_template" {
  default     = null
  description = "The gitignore template of the repository"
  type        = string
}

variable "has_branch_protection" {
  default     = true
  description = "Whether the repository has branch protection enabled"
  type        = bool
}

variable "has_discussions" {
  default     = false
  description = "Whether the repository has discussions enabled"
  type        = bool
}

variable "has_issues" {
  default     = false
  description = "Whether the repository has issues enabled"
  type        = bool
}

variable "has_projects" {
  default     = false
  description = "Whether the repository has projects enabled"
  type        = bool
}

variable "has_wiki" {
  default     = false
  description = "Whether the repository has wiki enabled"
  type        = bool
}

variable "license_template" {
  default     = null
  description = "Wheter the repository uses a license template"
  type        = string
}

variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "owner" {
  description = "The name of the repository"
  type        = string
}

variable "required_status_checks_contexts" {
  default     = []
  description = "The list of status checks to require in order to merge into this branch"
  type        = list(string)
}

variable "teams" {
  default     = null
  description = "The slug of the teams to grant access to"
  type        = map(string)

  validation {
    condition = alltrue([
      for value in var.teams : contains(
        [
          // https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository#permission
          "pull",
          "triage",
          "push",
          "maintain",
          "admin"
        ],
        value
      )
    ])

    error_message = "Team permissions must be one of 'pull', 'triage', 'push', 'maintain', 'admin'."
  }
}

variable "topics" {
  description = "The topics of the repository"
  default     = []
  type        = list(string)
}

variable "visibility" {
  default     = "private"
  description = "The visibility of the repository"
  type        = string
}

variable "vulnerability_alerts" {
  default     = false
  description = "Whether the repository has vulnerability alerts enabled"
  type        = bool
}
