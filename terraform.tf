terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "3.8.0"
    }
  }
}

variable "tokenlinode" {

  type = string

}

variable "passwords" {

  type = list(string)

}

variable "instances" {

  type = list(string)

}

variable "region" {

  type = list(string)

}

provider "linode" {
  # Configuration options
  token = var.tokenlinode
}



resource "linode_instance" "miner1" {
  label           = "miner1"
  image           = "linode/Ubuntu25.10"
  region          = var.region[0]
  type            = var.instances[0]

  root_pass       = var.passwords[0]

  tags       = ["miner1"]
  swap_size  = 256
  private_ip = true
}


resource "linode_instance" "miner2" {
  label           = "miner2"
  image           = "linode/Ubuntu25.10"
  region          = var.region[1]
  type            = var.instances[1]

  root_pass       = var.passwords[1]

  tags       = ["miner2"]
  swap_size  = 256
  private_ip = true

}



resource "linode_instance" "miner3" {
  label           = "miner1"
  image           = "linode/Ubuntu25.10"
  region          = var.region[2]
  type            = var.instances[2]

  root_pass       = var.passwords[2]

  tags       = ["miner3"]
  swap_size  = 256
  private_ip = true

}

