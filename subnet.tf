resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.aoki-vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "aoki-subnet"
  }
}
