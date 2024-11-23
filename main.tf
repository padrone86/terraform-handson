resource "aws_s3_bucket" "this" {
  bucket = "<your-bucket-name>"
  # 変数を使うケースでは以下のように記述する
  # bucket = var.bucket_name

  # 作成後に差分を出すパターン
  # tags = {
  #   hoge = "fuga"
  # }
}
