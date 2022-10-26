output "instancia_ec2" {
  value = aws_instance.nidio_ec2.*.public_ip
}