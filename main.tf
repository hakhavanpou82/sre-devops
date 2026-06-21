terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hetzner_token
}

resource "hcloud_ssh_key" "observability" {
  name       = "observability-key"
  public_key = file(pathexpand(var.ssh_public_key_path))
}

resource "hcloud_server" "observability" {
  name        = var.server_name
  image       = "ubuntu-24.04"
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.observability.id]

  labels = {
    purpose = "observability"
  }
}
