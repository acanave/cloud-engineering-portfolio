resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? 1 : 0
}

resource "aws_nat_gateway" "this" {
  count = var.enable_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.tags, { Name = "${var.vpc_name}-nat-gateway" })
}