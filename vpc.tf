resource "aws_vpc" "aoki-vpc" {
    cidr_block       = "10.0.0.0/16"
    tags = {
        Name = "aoki-handson"
    }
}
