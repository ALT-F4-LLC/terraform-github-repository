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

variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "owner" {
  description = "The name of the organization"
  type        = string
}

variable "required_status_checks_contexts" {
  default     = []
  description = "The list of status checks to require in order to merge into this branch"
  type        = list(string)
}

variable "team_slug" {
  description = "The slug of the team to grant access to"
  type        = string
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
