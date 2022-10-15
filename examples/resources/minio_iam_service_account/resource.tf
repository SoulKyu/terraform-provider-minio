resource "minio_iam_user" "test" {
   name = "test"
   force_destroy = true
   tags = {
    tag-key = "tag-value"
  }
}

resource "minio_iam_service_account" "test_service_account" {
  target_user = minio_iam_user.test.name
}

output "minio_access_key" {
  value = minio_iam_service_account.test_service_account.access_key
}

output "minio_secret_key" {
  value     = minio_iam_service_account.test_service_account.secret_key
  sensitive = true
}