resource "aws_s3_bucket" "code_bucket" {
  bucket        = "lti-project-code-bucket-rjd"
  force_destroy = true
}

resource "null_resource" "generate_zip" {
  provisioner "local-exec" {
    command = "sh ../generar-zip.sh"
  }

  triggers = {
    script_hash = filemd5("../generar-zip.sh")
  }
}

resource "aws_s3_object" "backend_zip" {
  bucket     = aws_s3_bucket.code_bucket.bucket
  key        = "backend.zip"
  source     = "../backend.zip"
  depends_on = [aws_s3_bucket.code_bucket, null_resource.generate_zip]
}

resource "aws_s3_object" "frontend_zip" {
  bucket     = aws_s3_bucket.code_bucket.bucket
  key        = "frontend.zip"
  source     = "../frontend.zip"
  depends_on = [aws_s3_bucket.code_bucket, null_resource.generate_zip]
}