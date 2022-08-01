terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23.0"
    }
  }
}

resource "aws_instance" "punch" {
    ami  = var.ami[count.index]
    count= length(var.ins_name)
    instance_type = "t2.micro"
    
    tags = {
      Name = var.ins_name[count.index],
      Owner= "karandeep"
  }
}

provider "aws"{
  region ="ap-south-1"
}
