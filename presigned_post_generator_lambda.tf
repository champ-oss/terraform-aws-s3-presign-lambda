data "archive_file" "presigned_post_generator_lambda" {
  type             = "zip"
  output_file_mode = "0666"
  source_file      = "${path.module}/presigned_post_generator_lambda/presigned_post_generator_lambda.py"
  output_path      = "${path.module}/presigned_post_generator_lambda.zip"
}

module "presigned_post_generator_lambda" {
  source           = "github.com/champ-oss/terraform-aws-lambda.git?ref=v1.0.137-616e273"
  git              = var.git
  name             = "presigned_post_generator_lambda"
  tags             = merge(local.tags, var.tags)
  runtime          = var.runtime
  handler          = "presigned_post_generator_lambda.handler"
  filename         = data.archive_file.presigned_post_generator_lambda.output_path
  source_code_hash = data.archive_file.presigned_post_generator_lambda.output_base64sha256
}

resource "aws_iam_role_policy_attachment" "presigned_post_generator_lambda" {
  policy_arn = aws_iam_policy.this.arn
  role       = module.presigned_post_generator_lambda.role_name
}
