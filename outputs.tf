output "arn" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function#arn"
  value       = module.presigned_post_generator_lambda.arn
}

output "function_name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function#function_name"
  value       = module.presigned_post_generator_lambda.function_name
}