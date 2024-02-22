terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5"
    }
  }

  required_version = ">= 1.4.0"
}
