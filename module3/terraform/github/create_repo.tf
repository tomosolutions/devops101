resource "github_repository" "test-repo" {
  name        = "ubsdemo"
  description = "Test repo from Terraform"

  visibility = "public"

  template {
    owner      = "tomosolutions"
    repository = "python-fastapi-template"
  }
}