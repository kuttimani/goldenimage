variable "ami_id" {
  description = "AMI id created from packer"
  type        = string
  default     = "ami-08b6312a5542eec8e"
}

variable "securitygroup_id" {
  description = "security group for new ec2 instance"
  type        = string
  default     = "sg-e9681b87"
}

variable "keypairname" {
  description = "key pair for access"
  type        = string
  default     = "mymac"
}

data "aws_ami" "centos78-ami" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["centos7.8-ssm-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_security_group" "default-sg"{
  filter {
      name = "group-name"
      values = ["default"]
  }
}
