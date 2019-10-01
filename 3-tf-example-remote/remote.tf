terraform {
  required_version = "~> 0.12.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "sophiahug"

    workspaces {
      prefix = "tf-example-"

    }
  }
}
