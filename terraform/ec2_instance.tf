provider "aws" {
   region = "eu-west-2"
}
resource "aws_instance" "centos78" {
    ami           = data.aws_ami.centos78-ami.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [data.aws_security_group.default-sg.id]
    key_name = var.keypairname
    tags = {
      Name = "centos78-ssm"
    }
  }
output "public_ip" {
    value       = aws_instance.centos78.public_ip
    description = "The public IP of the centos"
}
output "ami_id" {
    value  = data.aws_ami.centos78-ami.id
    description = "ami id used"
}
output "sg_id" {
  value = data.aws_security_group.default-sg.id
  description = "security group id"
}
