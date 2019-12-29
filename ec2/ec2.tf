# Create a new virtual machine based on AMI

data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
}

resource "aws_instance" "mm-ec2" {
    ami           = "data.aws_ami_ids.ubuntu.id"
    instance_type = "t2.micro"

    tags = {
        Name = "DSO"
    }
}