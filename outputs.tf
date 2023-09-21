output "full_name" {
  description = "The full name of the repository."
  value       = github_repository.self.full_name
}

output "html_url" {
  description = "The HTML URL of the repository."
  value       = github_repository.self.html_url
}

output "git_clone_url" {
  description = "The Git URL of the repository."
  value       = github_repository.self.git_clone_url
}

output "http_clone_url" {
  description = "The HTTP URL of the repository."
  value       = github_repository.self.http_clone_url
}

output "node_id" {
  description = "The Node ID of the repository."
  value       = github_repository.self.node_id
}

output "repo_id" {
  description = "The ID of the repository."
  value       = github_repository.self.id
}

output "ssh_clone_url" {
  description = "The SSH URL of the repository."
  value       = github_repository.self.ssh_clone_url
}

output "svn_url" {
  description = "The SVN URL of the repository."
  value       = github_repository.self.svn_url
}
