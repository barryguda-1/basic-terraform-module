output "subnet_id" {
  value = aws_subnet.this.id # this is the resource values from main.tf
}

output "ami_id" {
  value = data.aws_ssm_parameter.this.value
}
