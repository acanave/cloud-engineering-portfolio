resource "aws_subnet" "public" {
 count = length(var.public_subnets)

 vpc_id = aws_vpc.this.id
 cidr_block = var.public_subnets[count.index]
 availability_zone = element(var.availability_zones, count.index)

 tags = merge(var.tags, { Name = "${var.vpc_name}-public-${count.index}" })
}
resource "aws_subnet" "private" {
 count = length(var.private_subnets)
 vpc_id = aws_vpc.this.id
 cidr_block = var.private_subnets[count.index]
 availability_zone = element(var.availability_zones, count.index)

tags = merge(var.tags, { Name = "${var.vpc_name}-private-${count.index}" })
}