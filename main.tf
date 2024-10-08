terraform {
  cloud {
    organization = "rolasotelo"

    workspaces {
      name = "migration-lab-workspace"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
  }
}

provider "google" {
  project = "rolasotelo-default"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "no-public-access-bucket-rolando-sotelo"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
