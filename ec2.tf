resource "aws_instance" "nidio_ec2" {
  count         = 2
  ami           = var.ami
  instance_type = var.tipo_instancia
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2_${count.index}"
  }
}

resource "aws_instance" "nidio_ec2_ansible" {
  count         = 1
  ami           = var.ami
  instance_type = var.tipo_instancia
  key_name      = "${var.usuario}-terraform-aws"
  tags = {
    "Name" = "${var.usuario}-ec2-ansible${count.index}"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible -y
    sudo apt-get install ansible -y
  EOF  
}