terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
    random = {
      source = "hashicorp/random"
    }
    null = {
      source = "hashicorp/null"
    }
    powerplatform = {
      source  = "microsoft/power-platform"
      version = ">=3.3.0"
    }
  }
}

provider "powerplatform" {
  use_cli = true
}

module "identity" {
  source  = "./identity"
  aliases = var.aliases
}

module "power-platform" {
  source = "./power-platform"
  dev_environment_access_group_id  = module.identity.dev_environment_access_group.id
  test_environment_access_group_id = module.identity.test_environment_access_group.id
}