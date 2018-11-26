# node subnet a
resource "aws_subnet" "node-a" {
  vpc_id            ="${ aws_vpc.main.id }"
  cidr_block        = "${ var.cidr }.4.0/24"
  availability_zone = "${ var.region }a"

  tags {
    terraform_id = "${ var.env }-terraform"
    Name         = "${ var.env }-node-subnet-a"
    Environment  = "${ var.env }"
    Role         = "node"
    Zone         = "public"
  }
}
