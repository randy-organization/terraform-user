output "public_dns" {
  description = "this is to output the terraform-user server public ip"
  value       = aws_instance.terraform.public_dns
}