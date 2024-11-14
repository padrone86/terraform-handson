#########################
# Provider settings
#########################

provider "aws" {
  region  = "ap-northeast-1"
  profile = "${your profile name}"
  default_tags {
    tags = {
      purpose = "hands-on"
    }
  }
}
