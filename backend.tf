terraform {
  # ローカル管理の場合
  backend "local" {
    path = "terraform.tfstate"
  }
  # S3 に保存して共有する場合
  # backend "s3" {
  #   bucket = "your-bucket-name"
  #   key    = "your-module-name/terraform.tfstate"
  #   region = "your-region"
  # }
}
