# terraform-github-repository
Terraform module which creates GitHub repository resources.

## Breaking Changes

### 0.11.0

- removes `github_team` data lookup passed from `teams` variable
- uses team `id` instead of name as key in `teams` variable

#### Example

```hcl
teams = { "1234567890" = "maintain" }
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.self](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.self](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_webhook.self](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook) | resource |
| [github_team_repository.self](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | Whether to allow auto-merging pull requests | `bool` | `false` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Whether to allow merge commits | `bool` | `false` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Whether to allow rebase merges | `bool` | `true` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Whether to allow squash merges | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the repository | `string` | n/a | yes |
| <a name="input_dismiss_stale_reviews"></a> [dismiss\_stale\_reviews](#input\_dismiss\_stale\_reviews) | Whether to enable dismissing stale pull request reviews | `bool` | `true` | no |
| <a name="input_enable_pages"></a> [enable\_pages](#input\_enable\_pages) | Whether to enable GitHub Pages | `bool` | `false` | no |
| <a name="input_enforce_admins"></a> [enforce\_admins](#input\_enforce\_admins) | Whether to enforce branch protection for administrators | `bool` | `false` | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | The gitignore template of the repository | `string` | `null` | no |
| <a name="input_has_branch_protection"></a> [has\_branch\_protection](#input\_has\_branch\_protection) | Whether the repository has branch protection enabled | `bool` | `true` | no |
| <a name="input_has_discussions"></a> [has\_discussions](#input\_has\_discussions) | Whether the repository has discussions enabled | `bool` | `false` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Whether the repository has issues enabled | `bool` | `false` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Whether the repository has projects enabled | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Whether the repository has wiki enabled | `bool` | `false` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | The URL of a page to use as the repository's home page | `string` | `null` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | Wheter the repository uses a license template | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the repository | `string` | n/a | yes |
| <a name="input_pages_branch"></a> [pages\_branch](#input\_pages\_branch) | The branch to use for GitHub Pages | `string` | `null` | no |
| <a name="input_pages_build_type"></a> [pages\_build\_type](#input\_pages\_build\_type) | The build type of the GitHub Pages | `string` | `"workflow"` | no |
| <a name="input_pages_cname"></a> [pages\_cname](#input\_pages\_cname) | The custom domain of the GitHub Pages | `string` | `null` | no |
| <a name="input_pages_path"></a> [pages\_path](#input\_pages\_path) | The path to the GitHub Pages content | `string` | `null` | no |
| <a name="input_required_approving_review_count"></a> [required\_approving\_review\_count](#input\_required\_approving\_review\_count) | The number of approving reviews required to change code | `number` | `0` | no |
| <a name="input_required_status_checks_contexts"></a> [required\_status\_checks\_contexts](#input\_required\_status\_checks\_contexts) | The list of status checks to require in order to merge into this branch | `list(string)` | `[]` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | The team ids to grant access to, and their permission levels | `map(string)` | `{}` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | The topics of the repository | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the repository | `string` | `"private"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | Whether the repository has vulnerability alerts enabled | `bool` | `false` | no |
| <a name="input_webhooks"></a> [webhooks](#input\_webhooks) | Webhooks to configure for the repository | <pre>map(object({<br>    active       = bool<br>    events       = list(string)<br>    content_type = string<br>    url          = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | The full name of the repository. |
| <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url) | The Git URL of the repository. |
| <a name="output_html_url"></a> [html\_url](#output\_html\_url) | The HTML URL of the repository. |
| <a name="output_http_clone_url"></a> [http\_clone\_url](#output\_http\_clone\_url) | The HTTP URL of the repository. |
| <a name="output_node_id"></a> [node\_id](#output\_node\_id) | The Node ID of the repository. |
| <a name="output_repo_id"></a> [repo\_id](#output\_repo\_id) | The ID of the repository. |
| <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url) | The SSH URL of the repository. |
| <a name="output_svn_url"></a> [svn\_url](#output\_svn\_url) | The SVN URL of the repository. |
<!-- END_TF_DOCS -->
