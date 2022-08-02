terraform {
  cloud {
    organization = "sean-env"

    workspaces {
      name = "file_template-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    null = {
      source = "hashicorp/null"
    }
  }

}

variable "ROOT_VEGETABLE" { default = "turnip" }

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

provider "null" {}

data "template_file" "my_json_template" {
  template = file("my-json-file.json")
  vars = {
    ROOT_VEGETABLE = var.ROOT_VEGETABLE
  }
}

resource "null_resource" "test" {
  count = 1
}
