resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.aoki-vpc.id}"

  tags = {
    Name = "aoki-handson"
  }
}

resource "aws_default_route_table" "default-route-table" {
  default_route_table_id = "${aws_vpc.aoki-vpc.default_route_table_id}"

  route = {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "aoki-handson"
  }
}

resource "aws_route_table_association" "route-subnet" {
  route_table_id = "${aws_default_route_table.default-route-table.id}"
  subnet_id      = "${aws_subnet.main.id}"
}
