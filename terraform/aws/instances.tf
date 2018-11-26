# node instance - subnet a
resource "aws_instance" "node-a" {
  ami = "${ data.aws_ami.ubuntu.id }"
  associate_public_ip_address = true
  count = "1"
  iam_instance_profile = "${ var.env }-node-profile"
  instance_type = "${ var.type }"
  lifecycle {
    ignore_changes = ["ami"]
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = "250"
  }
  key_name = "${ var.keypair }"
  private_ip = "${ cidrhost(aws_subnet.node-a.cidr_block, 10) }"
  subnet_id = "${ aws_subnet.node-a.id }"
  tenancy = "${ var.tenancy }"
  user_data = "${file("user_data.sh")}"
  vpc_security_group_ids = ["${ aws_security_group.node.id }"]
  tags {
    Name = "${ var.env }-node-a-${ count.index }"
    terraform_id = "${ var.env }-terraform"
    Environment = "${ var.env }"
    Role = "node"
    sshUser = "ubuntu"
  }
}
